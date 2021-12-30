import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/chat_repository.dart';

class ChatRepositoryWs extends ChangeNotifier implements ChatRepository {
  final channel = WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:8080/ws'));
  ChatRepositoryWs() {
    getChats();
    channel.stream.listen((response) {
      final json = jsonDecode(response);
      chats.add(Chat(
          json['content'], json['user_id'], DateTime.parse(json['CreatedAt'])));
      print(this.chats[chats.length - 1].body);
      notifyListeners();
    });
  }

  @override
  List<Chat> chats = [];

  @override
  Future<void> getChats() async {
    var response = await http.get(Uri.http('127.0.0.1:8080', "/post"));
    chats = [];
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      json.decode(utf8.decode(response.bodyBytes)).forEach((element) =>
          chats.add(Chat(element['content'], element['user_id'],
              DateTime.parse(element['CreatedAt']))));
    }
    notifyListeners();
  }

  @override
  Future<void> postChats(String body) async {
    channel.sink.add('{"content":"$body","user_id":7}');
  }
}
