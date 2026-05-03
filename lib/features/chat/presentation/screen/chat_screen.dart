import 'package:ecwaiproject/features/chat/presentation/controller/chat_controller.dart';
import 'package:ecwaiproject/features/chat/presentation/state/chate_status.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/message_input.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/message_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    controller.clear();
    context.read<ChatController>().sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    // Only rebuild when these change
    final status = context.select((ChatController c) => c.status);
    final error = context.select((ChatController c) => c.errormessage);
    final messages = context.select((ChatController c) => c.messages);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("English Conversation With AI"),
      ),
      body: Column(
        children: [
          /// Messages
          Expanded(child: MessageList(messages: messages)),

          /// Status (loading / error)
          _buildStatus(status, error!),

          /// Input
          MessageInput(
            controller: controller,
            onSend: status == ChatStatus.loading ? () {} : sendMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildStatus(ChatStatus status, String error) {
    switch (status) {
      case ChatStatus.loading:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        );

      case ChatStatus.error:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(error, style: const TextStyle(color: Colors.red)),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
