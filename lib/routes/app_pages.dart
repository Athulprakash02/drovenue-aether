import 'package:get/get.dart';
import 'app_routes.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/view/home_view.dart';

import '../modules/raid/bindings/raid_binding.dart';
import '../modules/raid/view/raid_view.dart';

import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/view/chat_view.dart';

import '../modules/countdown/bindings/countdown_binding.dart';
import '../modules/countdown/view/countdown_view.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.raid,
      page: () => const RaidView(),
      binding: RaidBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage<dynamic>(
      name: Routes.countdown,
      page: () => const CountdownView(),
      binding: CountdownBinding(),
    ),
  ];
}
