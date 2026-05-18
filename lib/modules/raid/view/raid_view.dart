import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/raid_model.dart';
import '../controller/raid_controller.dart';

class RaidView extends GetView<RaidController> {
  const RaidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raid Join System'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.activeRaids.isEmpty) {
          return const Center(child: Text('No active raids available.'));
        }

        return ListView.builder(
          itemCount: controller.activeRaids.length,
          itemBuilder: (BuildContext context, int index) {
            final Raid raid = controller.activeRaids[index];
            final int currentParticipants = raid.participantIds.length;
            final bool isFull = currentParticipants >= raid.maxParticipants;
            final bool hasAlreadyJoined = raid.participantIds.contains(controller.currentUserId);

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(raid.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Participants: $currentParticipants/${raid.maxParticipants}'),
                trailing: ElevatedButton(
                  onPressed: isFull || hasAlreadyJoined || controller.isJoining.value
                      ? null
                      : () => controller.joinRaid(raid.id),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasAlreadyJoined 
                        ? Colors.green 
                        : (isFull ? Colors.grey : Colors.deepPurple),
                  ),
                  child: controller.isJoining.value
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : Text(hasAlreadyJoined ? 'Joined' : (isFull ? 'Full' : 'Join')),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
