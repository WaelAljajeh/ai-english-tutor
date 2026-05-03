import 'package:ecwaiproject/features/chat/domain/entities/message.dart';
import 'package:ecwaiproject/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final List<Message> messages;
  const MessageList({super.key, required this.messages});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      itemBuilder: (context, index) {
        final curmessage = widget.messages[index];
        return ChatBubble(currentMessage: curmessage);
      },
      itemCount: widget.messages.length,
    );
  }
}
