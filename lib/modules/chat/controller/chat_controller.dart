import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/chat_message_model.dart';
import '../../../data/repositories/chat_repository.dart';

class ChatController extends GetxController {
  final ChatRepository repository;
  ChatController({required this.repository});

  final RxList<ChatMessage> newMessages = <ChatMessage>[].obs;
  final RxList<ChatMessage> historicalMessages = <ChatMessage>[].obs;
  
  List<ChatMessage> get allMessages => <ChatMessage>[...newMessages, ...historicalMessages];

  final RxBool isInitialLoading = true.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasReachedEnd = false.obs;

  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  
  // Dummy user ID for this example
  final String _currentUserId = 'user_123';
  String get currentUserId => _currentUserId;

  late final DateTime _roomOpenTime;
  DocumentSnapshot<Map<String, dynamic>>? _lastDocument;

  @override
  void onInit() {
    super.onInit();
    _roomOpenTime = DateTime.now();
    _bindScrollController();
    _loadInitialData();
  }

  void _bindScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
        _loadMoreHistoricalMessages();
      }
    });
  }

  Future<void> _loadInitialData() async {
    isInitialLoading.value = true;
    
    // 1. Fetch first chunk of history
    await _loadMoreHistoricalMessages();
    
    // 2. Bind real-time listener for NEW messages only
    newMessages.bindStream(repository.listenToNewMessages(_roomOpenTime));
    
    isInitialLoading.value = false;
  }

  Future<void> _loadMoreHistoricalMessages() async {
    if (isLoadingMore.value || hasReachedEnd.value) return;

    isLoadingMore.value = true;

    try {
      final Map<String, dynamic> result = await repository.getHistoricalMessages(
        startAfter: _lastDocument,
        limit: 20,
        maxTime: _roomOpenTime,
      );

      final List<ChatMessage> fetchedMessages = result['messages'] as List<ChatMessage>;
      final DocumentSnapshot<Map<String, dynamic>>? lastDoc = result['lastDocument'] as DocumentSnapshot<Map<String, dynamic>>?;

      if (fetchedMessages.isEmpty) {
        hasReachedEnd.value = true;
      } else {
        historicalMessages.addAll(fetchedMessages);
        _lastDocument = lastDoc;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load historical messages');
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> sendMessage() async {
    final String text = textController.text.trim();
    if (text.isEmpty) return;
    
    textController.clear();
    try {
      await repository.sendMessage(text, _currentUserId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to send message.');
    }
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
