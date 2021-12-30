import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChangeNotifier implements ChatRepository {
  ChatRepositoryImpl();

  @override
  Future<List<Chat>> getChats() async {
    List<Chat> chats = [];
    var response = await http.get(Uri.http('127.0.0.1:8080', "/post"));
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      json.decode(utf8.decode(response.bodyBytes)).forEach((element) =>
          chats.add(Chat(element['content'], element['user_id'],
              DateTime.parse(element['CreatedAt']))));
    }
    return chats;
  }

  @override
  Future<void> postChats(String body) async {
    await http.post(Uri.http('127.0.0.1:8080', '/post'),
        headers: {"Content-Type": "application/json"},
        body: '{"content":"$body","user_id":5}');
  }

  @override
  late List<Chat> chats;
}
