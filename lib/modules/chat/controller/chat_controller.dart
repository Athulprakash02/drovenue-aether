import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/chat_message_model.dart';
import '../../../data/repositories/chat_repository.dart';

class ChatController extends GetxController {
  final ChatRepository repository;
  ChatController({required this.repository});

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = true.obs;
  final TextEditingController textController = TextEditingController();
  
  // Dummy user ID for this example
  final String _currentUserId = 'user_123';
  String get currentUserId => _currentUserId;

  @override
  void onInit() {
    super.onInit();
    _bindChatStream();
  }

  void _bindChatStream() {
    messages.bindStream(repository.getChatStream());
    ever(messages, (List<ChatMessage> _) {
      if (isLoading.value) {
        isLoading.value = false;
      }
    });
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
    super.onClose();
  }
}
