import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/countdown_controller.dart';

class CountdownView extends GetView<CountdownController> {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
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
    );
  }
}
