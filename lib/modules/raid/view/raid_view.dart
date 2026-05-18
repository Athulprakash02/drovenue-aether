import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/raid_model.dart';
import '../controller/raid_controller.dart';

class RaidView extends GetView<RaidController> {
  const RaidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator(color: Color(0xFF00FFC2)));
      }

      if (controller.activeRaids.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'NO ACTIVE RAIDS',
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: controller.activeRaids.length,
        itemBuilder: (BuildContext context, int index) {
          final Raid raid = controller.activeRaids[index];
          final int currentParticipants = raid.participantIds.length;
          final bool isFull = currentParticipants >= raid.maxParticipants;
          final bool hasAlreadyJoined = raid.participantIds.contains(controller.currentUserId);

          String statusText = 'ACTIVE';
          Color statusColor = const Color(0xFF00FFC2); // Neon Cyan

          if (hasAlreadyJoined) {
            statusText = 'JOINED';
            statusColor = const Color(0xFFB026FF); // Neon Purple
          } else if (isFull) {
            statusText = 'FULL';
            statusColor = Colors.redAccent;
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1D2D),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF2A2D43)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        raid.title.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: statusColor.withOpacity(0.5)),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '$currentParticipants / ${raid.maxParticipants} Slots Filled',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isFull || hasAlreadyJoined || controller.isJoining.value
                        ? null
                        : () => controller.joinRaid(raid.id),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00FFC2),
                      foregroundColor: Colors.black,
                      disabledBackgroundColor: const Color(0xFF2A2D43),
                      disabledForegroundColor: Colors.white54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: hasAlreadyJoined || isFull ? 0 : 4,
                    ),
                    child: controller.isJoining.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
                          )
                        : Text(
                            hasAlreadyJoined ? 'ALREADY JOINED' : (isFull ? 'RAID FULL' : 'JOIN RAID'),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
