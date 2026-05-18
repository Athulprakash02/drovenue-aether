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
      appBar: AppBar(title: const Text('PROJECT AETHER: COMMAND HUB')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF0F111A), // Deep dark
              Color(0xFF141622), // Slightly lighter
            ],
          ),
        ),
        child: const Column(
          children: <Widget>[
            // 1. The Global Pulse
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: CountdownView(),
            ),

            // 2. The Geo-Raid
            Expanded(flex: 3, child: RaidView()),

            Divider(height: 1, thickness: 1, color: Color(0xFF2A2D43)),

            // 3. The Engagement Chat
            Expanded(flex: 4, child: ChatView()),
          ],
        ),
      ),
    );
  }
}
