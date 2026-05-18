import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';
import '../models/raid_model.dart';

class RaidRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Raid>> getActiveRaids() {
    return _firestore
        .collection(AppConstants.raidsCollection)
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        final Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        // Default to empty list if missing in older documents
        if (data['participantIds'] == null) {
          data['participantIds'] = <String>[];
        }
        return Raid.fromJson(data);
      }).toList();
    });
  }

  Future<void> joinRaid(String raidId, String userId) async {
    final DocumentReference<Map<String, dynamic>> docRef = _firestore.collection(AppConstants.raidsCollection).doc(raidId);
    
    // Using Firestore transactions absolutely prevents race conditions
    // as it locks the document for atomic read-modify-write operations.
    await _firestore.runTransaction((Transaction transaction) async {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await transaction.get(docRef);
      if (!snapshot.exists) {
        throw Exception('Raid does not exist!');
      }

      final Map<String, dynamic> data = snapshot.data()!;
      final int maxParticipants = data['maxParticipants'] as int;
      
      final List<dynamic> rawIds = data['participantIds'] as List<dynamic>? ?? <dynamic>[];
      final List<String> participantIds = List<String>.from(rawIds);

      // 1. Prevent duplicate joins
      if (participantIds.contains(userId)) {
        throw Exception('You have already joined this raid!');
      }

      // 2. Enforce strict 15 maximum
      if (participantIds.length >= maxParticipants) {
        throw Exception('Raid is full!');
      }

      // 3. Guarantee success state
      participantIds.add(userId);

      // Using update on the transaction commits the changes safely
      transaction.update(docRef, <String, dynamic>{
        'participantIds': participantIds,
      });
    });
  }
}
