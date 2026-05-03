import 'package:ecwaiproject/features/chat/data/repositories/chat_repository.dart';
import 'package:ecwaiproject/features/chat/domain/entities/message.dart';
import 'package:ecwaiproject/features/chat/presentation/state/chate_status.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  ChatStatus _status = ChatStatus.idle;
  ChatStatus get status => _status;
  String? errormessage;
  final List<Message> _messages = [];
  List<Message> get messages => List.unmodifiable(_messages);
  final ChatRepository _repository;
  ChatController(this._repository) {
    _messages.add(
      Message(textMessage: "Hello! I'm your English tutor 😊", isUser: false),
    );
  }
  Future<void> sendMessage(String text) async {
    errormessage = null;
    _status = ChatStatus.loading;
    notifyListeners();
    _messages.add(Message(textMessage: text, isUser: true));
    try {
      final replyMessage = _repository.sendMessage(text);
      _messages.add(await replyMessage);
      _status = ChatStatus.success;
    } catch (e) {
      _status = ChatStatus.error;
      _messages.add(
        Message(
          textMessage: "Sorry, something went wrong. Please try again.",
          isUser: false,
        ),
      );
      errormessage = "Sorry, something went wrong. Please try again.";
    } finally {
      notifyListeners();
    }
  }
}
