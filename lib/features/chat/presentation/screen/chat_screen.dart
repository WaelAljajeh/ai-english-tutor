import 'package:ecwaiproject/features/chat/data/repositories/chat_repository.dart';
import 'package:ecwaiproject/features/chat/data/services/api_service.dart';
import 'package:ecwaiproject/features/chat/presentation/controller/chat_controller.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/message_input.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/message_list.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late TextEditingController controller;
  late ChatController _chatController;
  @override
  @override
  void initState() {
    _chatController = ChatController(ChatRepository(ApiService()));
    controller = TextEditingController();
    super.initState();
  }

  void sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    controller.clear();

    await _chatController.sendMessage(text);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final messages = _chatController.messages;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("English Conversation With Ai"),
      ),
      body: Column(
        children: [
          Expanded(child: MessageList(messages: messages)),
          MessageInput(controller: controller, onSend: sendMessage),
        ],
      ),
    );
  }
}
