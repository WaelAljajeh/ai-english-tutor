import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://unmoving-wound-achiness.ngrok-free.dev";

  Future<String> sendMessage(String message, String userId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/chat"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"message": message, "userId": userId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["reply"];
    } else {
      throw Exception("Failed: ${response.body}");
    }
  }
}
