import 'package:get/get.dart';
import '../../../data/repositories/chat_repository.dart';
import '../controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(() => ChatRepository());
    Get.lazyPut<ChatController>(() => ChatController(repository: Get.find<ChatRepository>()));
  }
}
