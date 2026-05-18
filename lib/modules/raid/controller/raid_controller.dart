import 'package:get/get.dart';
import '../../../data/models/raid_model.dart';
import '../../../data/repositories/raid_repository.dart';

class RaidController extends GetxController {
  final RaidRepository repository;
  RaidController({required this.repository});

  final RxList<Raid> activeRaids = <Raid>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isJoining = false.obs;
  
  // Dummy user ID for this session. In a real app, this comes from FirebaseAuth.
  final String _currentUserId = 'user_abc123';
  String get currentUserId => _currentUserId;

  @override
  void onInit() {
    super.onInit();
    _bindRaidsStream();
  }

  void _bindRaidsStream() {
    activeRaids.bindStream(repository.getActiveRaids());
    ever(activeRaids, (List<Raid> _) {
      if (isLoading.value) {
        isLoading.value = false;
      }
    });
  }

  Future<void> joinRaid(String raidId) async {
    if (isJoining.value) return;
    
    isJoining.value = true;
    try {
      await repository.joinRaid(raidId, _currentUserId);
      Get.snackbar('Success', 'Successfully joined the raid!');
    } catch (e) {
      // Gracefully handle UI failure state based on transaction rejection
      Get.snackbar('Join Failed', e.toString().replaceAll('Exception: ', ''));
    } finally {
      isJoining.value = false;
    }
  }
}
