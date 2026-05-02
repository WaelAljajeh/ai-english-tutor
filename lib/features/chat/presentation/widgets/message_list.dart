import 'package:ecwaiproject/features/chat/domain/entities/message.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;
  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        final curmessage = messages[index];
        return ChatBubble(currentMessage: curmessage);
      },
      itemCount: messages.length,
    );
  }
}
