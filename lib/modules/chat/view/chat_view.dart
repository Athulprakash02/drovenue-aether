import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/chat_message_model.dart';
import '../controller/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Obx(() {
            if (controller.isInitialLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            
            if (controller.allMessages.isEmpty) {
              return const Center(child: Text('No messages yet.'));
            }

            return ListView.builder(
              controller: controller.scrollController,
              reverse: true,
              itemCount: controller.allMessages.length + (controller.isLoadingMore.value ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (index == controller.allMessages.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final ChatMessage message = controller.allMessages[index];
                final bool isMe = message.senderId == controller.currentUserId;
                
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.deepPurple[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(message.text),
                  ),
                );
              },
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller.textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (String _) => controller.sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send),
                color: Colors.deepPurple,
                onPressed: controller.sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
