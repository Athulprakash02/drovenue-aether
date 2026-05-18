import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../../countdown/view/countdown_view.dart';
import '../../raid/view/raid_view.dart';
import '../../chat/view/chat_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aether: World Event Dashboard'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const Column(
        children: <Widget>[
          // 1. The Global Pulse
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: CountdownView(),
          ),
          
          // 2. The Geo-Raid
          RaidView(),
          
          Divider(height: 32, thickness: 2),
          
          // 3. The Engagement Chat
          Expanded(
            child: ChatView(),
          ),
        ],
      ),
    );
  }
}
