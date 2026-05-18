import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/countdown_controller.dart';

class CountdownView extends GetView<CountdownController> {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isLive = controller.bossState.value == BossState.live;
      final Color accentColor = isLive ? const Color(0xFFFF4C4C) : const Color(0xFF00FFC2); // Red for live, Cyan for preparing
      
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF141622),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accentColor.withValues(alpha: 0.3), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: 0.15),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Event Label
            Text(
              isLive ? '🔥 WORLD BOSS IS LIVE 🔥' : '🌍 GLOBAL EVENT',
              style: TextStyle(
                color: accentColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 8),
            
            // Sub-label (Preparing only)
            if (!isLive)
              Text(
                'WORLD BOSS ARRIVES IN',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            
            const SizedBox(height: 16),
            
            // Hero Countdown (Preparing only)
            if (!isLive)
              Text(
                controller.formattedTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42, 
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(color: accentColor, blurRadius: 15),
                  ],
                  fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
                ),
              ),
              
            if (!isLive) const SizedBox(height: 24),
            
            // Boss Name
            Text(
              controller.bossName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            
            // Status Badge / Footer
            if (isLive)
              Text(
                'Raid Open Now',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(color: accentColor, blurRadius: 10),
                  ],
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: accentColor.withValues(alpha: 0.5)),
                ),
                child: Text(
                  'PREPARING',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
