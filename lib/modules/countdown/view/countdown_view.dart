import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/countdown_controller.dart';

class CountdownView extends GetView<CountdownController> {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.isFinished) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Time is up!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.resetTimer,
                  child: const Text('Restart Timer'),
                ),
              ],
            );
          }

          // Renders Reactively every 100ms
          return Text(
            '${controller.formattedTime}s',
            style: const TextStyle(
              fontSize: 64, 
              fontWeight: FontWeight.bold,
              // Using tabular figures prevents text from jittering during rapid number changes
              fontFeatures: <FontFeature>[FontFeature.tabularFigures()],
            ),
          );
        }),
      ),
    );
  }
}
