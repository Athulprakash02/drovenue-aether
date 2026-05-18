import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  void navigateToRaid() => Get.toNamed(Routes.raid);
  void navigateToChat() => Get.toNamed(Routes.chat);
  void navigateToCountdown() => Get.toNamed(Routes.countdown);
}
