import 'package:get/get.dart';
import '../../../data/repositories/raid_repository.dart';
import '../controller/raid_controller.dart';

class RaidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RaidRepository>(() => RaidRepository());
    Get.lazyPut<RaidController>(() => RaidController(repository: Get.find<RaidRepository>()));
  }
}
