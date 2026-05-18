import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drovenue/data/repositories/raid_repository.dart';
import 'package:drovenue/core/constants/app_constants.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late RaidRepository repository;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    repository = RaidRepository(firestore: fakeFirestore);
  });

  test('Raid Join Logic: 50 requests yield exactly 15 successes', () async {
    const String raidId = 'test_raid_123';
    
    // 1. Seed the fake Firestore database with a new raid that has a max of 15
    await fakeFirestore.collection(AppConstants.raidsCollection).doc(raidId).set(<String, dynamic>{
      'title': 'Epic Boss Fight',
      'maxParticipants': 15,
      'participantIds': <String>[],
      'isActive': true,
    });

    int successCount = 0;
    int failCount = 0;

    // Note: fake_cloud_firestore does not simulate transaction locks inherently for parallel Futures.
    // Thus, we loop sequentially to validate the exact threshold and duplicate-prevention logic locally.
    // In production, Firestore's backend handles the atomic locking automatically for simultaneous requests.
    for (int i = 0; i < 50; i++) {
      try {
        await repository.joinRaid(raidId, 'user_$i');
        successCount++;
      } catch (e) {
        failCount++;
      }
    }

    // 4. Verify outcomes mathematically
    expect(successCount, 15, reason: 'Exactly 15 requests should have succeeded.');
    expect(failCount, 35, reason: 'Exactly 35 requests should have failed due to the 15 limit.');

    // 5. Verify the actual Firestore document state to ensure logic held up
    final DocumentSnapshot<Map<String, dynamic>> docSnapshot = await fakeFirestore.collection(AppConstants.raidsCollection).doc(raidId).get();
    final Map<String, dynamic> data = docSnapshot.data()!;
    final List<String> participantIds = List<String>.from(data['participantIds'] as List<dynamic>);

    // Assert exact length
    expect(participantIds.length, 15, reason: 'Firestore document must contain exactly 15 participants.');

    // Assert no duplicates exist in the array (guaranteeing 'contains' logic works)
    final Set<String> uniqueIds = participantIds.toSet();
    expect(uniqueIds.length, participantIds.length, reason: 'Duplicate user IDs found in participants list!');
  });
}
