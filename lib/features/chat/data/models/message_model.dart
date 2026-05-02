import '../../domain/entities/message.dart';

class MessageModel {
  final String textMessage;
  final bool isUser;

  MessageModel({required this.textMessage, required this.isUser});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(textMessage: json['text'], isUser: json['isUser']);
  }

  Message toEntity() {
    return Message(textMessage: textMessage, isUser: isUser);
  }
}
