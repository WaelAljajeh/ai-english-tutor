import 'package:ecwaiproject/features/chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Message currentMessage;
  const ChatBubble({super.key, required this.currentMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: currentMessage.isUser
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: currentMessage.isUser ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          currentMessage.textMessage,
          style: TextStyle(
            color: currentMessage.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
