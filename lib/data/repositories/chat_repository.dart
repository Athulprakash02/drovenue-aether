import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';
import '../models/chat_message_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> getChatStream() {
    return _firestore
        .collection(AppConstants.chatsCollection)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        final Map<String, dynamic> data = doc.data();
        data['id'] = doc.id; // Inject ID
        // Convert Firestore Timestamp to DateTime for Freezed model
        if (data['timestamp'] is Timestamp) {
           data['timestamp'] = (data['timestamp'] as Timestamp).toDate().toIso8601String();
        }
        return ChatMessage.fromJson(data);
      }).toList();
    });
  }

  Future<void> sendMessage(String text, String senderId) async {
    await _firestore.collection(AppConstants.chatsCollection).add(<String, dynamic>{
      'senderId': senderId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
