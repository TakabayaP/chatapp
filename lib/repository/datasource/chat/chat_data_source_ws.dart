import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/datasource/chat/active_chat_data_source.dart';

class ChatDataSourceWs extends ChangeNotifier implements ActiveChatDataSource {
  ChatDataSourceWs() {
    channel.stream.listen((event) {
      newChat = Chat.fromJson(jsonDecode(event));
      notifyListeners();
    });
  }

  @override
  late Chat newChat;
  WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:8080/ws'));

  @override
  Future<void> postChat(Chat chat) async {
    channel.sink.add(jsonEncode(chat));
    print(jsonEncode(chat));
  }
}
