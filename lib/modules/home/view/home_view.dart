import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: controller.navigateToRaid,
              child: const Text('Raid System'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.navigateToChat,
              child: const Text('Real-time Chat'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.navigateToCountdown,
              child: const Text('Countdown Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
