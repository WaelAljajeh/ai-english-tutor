import 'package:ecwaiproject/features/chat/data/services/api_service.dart';
import 'package:ecwaiproject/features/chat/domain/entities/message.dart';

class ChatRepository {
  final ApiService _chatApiService;
  ChatRepository(this._chatApiService);
  Future<Message> sendMessage(String text) async {
    final message = await _chatApiService.sendMessage(text, "user1");
    return Message(textMessage: message, isUser: false);
  }
}
