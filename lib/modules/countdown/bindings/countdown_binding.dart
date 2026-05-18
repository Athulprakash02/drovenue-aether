import 'package:get/get.dart';
import '../controller/countdown_controller.dart';

class CountdownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountdownController>(() => CountdownController());
  }
}
