import 'package:ecwaiproject/features/chat/data/repositories/chat_repository.dart';
import 'package:ecwaiproject/features/chat/domain/entities/message.dart';

class ChatController {
  List<Message> messages = [];
  final ChatRepository _repository;
  ChatController(this._repository) {
    messages.add(
      Message(textMessage: "Hello! I'm your English tutor 😊", isUser: false),
    );
  }
  Future<void> sendMessage(String text) async {
    messages.add(Message(textMessage: text, isUser: true));
    final replyMessage = _repository.sendMessage(text);
    messages.add(await replyMessage);
  }
}
