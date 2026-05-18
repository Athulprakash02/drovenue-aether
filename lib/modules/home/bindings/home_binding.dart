import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../../countdown/controller/countdown_controller.dart';
import '../../raid/controller/raid_controller.dart';
import '../../chat/controller/chat_controller.dart';
import '../../../data/repositories/raid_repository.dart';
import '../../../data/repositories/chat_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CountdownController>(() => CountdownController());
    Get.lazyPut<RaidRepository>(() => RaidRepository());
    Get.lazyPut<RaidController>(() => RaidController(repository: Get.find<RaidRepository>()));
    Get.lazyPut<ChatRepository>(() => ChatRepository());
    Get.lazyPut<ChatController>(() => ChatController(repository: Get.find<ChatRepository>()));
  }
}
