import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/countdown_controller.dart';

class CountdownView extends GetView<CountdownController> {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF141622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00FFC2).withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00FFC2).withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'WORLD BOSS ARRIVES IN',
            style: TextStyle(
              color: const Color(0xFF00FFC2).withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            // Renders Reactively every 100ms
            return Text(
              '${controller.formattedTime}s',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64, 
                fontWeight: FontWeight.w900,
                letterSpacing: 4.0,
                shadows: [
                  Shadow(
                    color: Color(0xFF00FFC2),
                    blurRadius: 15,
                  ),
                ],
                // Using tabular figures prevents text from jittering during rapid number changes
                fontFeatures: <FontFeature>[FontFeature.tabularFigures()],
              ),
            );
          }),
        ],
      ),
    );
  }
}
