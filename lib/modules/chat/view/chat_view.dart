import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/chat_message_model.dart';
import '../controller/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0F111A), // Dark chat background
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() {
              if (controller.isInitialLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF00FFC2)),
                );
              }

              if (controller.allMessages.isEmpty) {
                return const Center(
                  child: Text(
                    'NO MESSAGES YET',
                    style: TextStyle(color: Colors.white54, letterSpacing: 2.0),
                  ),
                );
              }

              return ListView.builder(
                controller: controller.scrollController,
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                itemCount:
                    controller.allMessages.length +
                    (controller.isLoadingMore.value ? 1 : 0),
                itemBuilder: (BuildContext context, int index) {
                  if (index == controller.allMessages.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF00FFC2),
                        ),
                      ),
                    );
                  }

                  final ChatMessage message = controller.allMessages[index];
                  final bool isMe =
                      message.senderId == controller.currentUserId;
                  final String hh = message.timestamp.hour.toString().padLeft(2, '0');
                  final String mm = message.timestamp.minute.toString().padLeft(2, '0');
                  final String formattedTime = '$hh:$mm';

                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isMe
                            ? const Color(0xFF141622)
                            : const Color(0xFF1A1D2D),
                        borderRadius: BorderRadius.circular(12).copyWith(
                          bottomRight: isMe ? const Radius.circular(0) : null,
                          bottomLeft: !isMe ? const Radius.circular(0) : null,
                        ),
                        border: Border.all(
                          color: isMe
                              ? const Color(0xFF00FFC2).withOpacity(0.3)
                              : const Color(0xFF2A2D43),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.text,
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formattedTime,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Color(0xFF141622),
              border: Border(top: BorderSide(color: Color(0xFF2A2D43))),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Transmit message...',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF0F111A),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                          color: Color(0xFF00FFC2),
                          width: 1,
                        ),
                      ),
                    ),
                    onSubmitted: (String _) => controller.sendMessage(),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF00FFC2),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.black,
                    onPressed: controller.sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
