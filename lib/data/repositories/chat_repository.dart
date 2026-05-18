import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';
import '../models/chat_message_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Listens ONLY to messages that arrive AFTER the user opened the chat.
  /// Extremely scalable; minimizes read costs.
  Stream<List<ChatMessage>> listenToNewMessages(DateTime startTime) {
    return _firestore
        .collection(AppConstants.chatsCollection)
        .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startTime))
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        final Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        if (data['timestamp'] is Timestamp) {
           data['timestamp'] = (data['timestamp'] as Timestamp).toDate().toIso8601String();
        }
        return ChatMessage.fromJson(data);
      }).toList();
    });
  }

  /// Fetches a paginated chunk of historical messages.
  /// Returns a tuple of [messages, lastDocumentSnapshot].
  Future<Map<String, dynamic>> getHistoricalMessages({
    DocumentSnapshot<Map<String, dynamic>>? startAfter,
    int limit = 20,
    required DateTime maxTime,
  }) async {
    Query<Map<String, dynamic>> query = _firestore
        .collection(AppConstants.chatsCollection)
        .where('timestamp', isLessThan: Timestamp.fromDate(maxTime))
        .orderBy('timestamp', descending: true)
        .limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
    
    final List<ChatMessage> messages = snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
      final Map<String, dynamic> data = doc.data();
      data['id'] = doc.id;
      if (data['timestamp'] is Timestamp) {
         data['timestamp'] = (data['timestamp'] as Timestamp).toDate().toIso8601String();
      }
      return ChatMessage.fromJson(data);
    }).toList();

    return <String, dynamic>{
      'messages': messages,
      'lastDocument': snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    };
  }

  Future<void> sendMessage(String text, String senderId) async {
    await _firestore.collection(AppConstants.chatsCollection).add(<String, dynamic>{
      'senderId': senderId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
