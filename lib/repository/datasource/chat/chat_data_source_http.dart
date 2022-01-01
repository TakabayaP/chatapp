import 'dart:convert';

import 'package:chatapp/model/chat_model.dart';
import 'package:http/http.dart' as http;

import 'package:chatapp/repository/datasource/chat/passive_chat_data_source.dart';

class ChatDataSourceHttp implements PassiveChatDataSource {
  @override
  Future<List<Chat>> getChats() async {
    List<Chat> chats = [];
    var response = await http.get(Uri.http('127.0.0.1:8080', "/chat"));
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      if (json.decode(utf8.decode(response.bodyBytes)) != null) {
        json
            .decode(utf8.decode(response.bodyBytes))
            .forEach((json) => chats.add(Chat.fromJson(json)));
      }
    }
    return chats;
  }

  @override
  Future<void> postChat(Chat chat) async {
    await http.post(Uri.http('127.0.0.1:8080', '/post'),
        headers: {"Content-Type": "application/json"}, body: chat.toJson());
  }
}
