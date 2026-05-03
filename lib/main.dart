import 'package:ecwaiproject/features/chat/data/repositories/chat_repository.dart';
import 'package:ecwaiproject/features/chat/data/services/api_service.dart';
import 'package:ecwaiproject/features/chat/presentation/controller/chat_controller.dart';
import 'package:ecwaiproject/features/chat/presentation/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(ChatRepository(ApiService())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const ChatMessage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
