import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:chatapp/model/chatroom_model.dart';
import 'package:chatapp/repository/datasource/chatroom/chatroom_data_source.dart';

class ChatroomDataSourceImpl extends ChangeNotifier
    implements ChatroomDataSource {
  @override
  Future<List<Chatroom>> getChatrooms() async {
    List<Chatroom> chatrooms = [];
    var response = await http.get(Uri.http('127.0.0.1:8080', "/chatrooms"));
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      if (json.decode(utf8.decode(response.bodyBytes)) != null) {
        json
            .decode(utf8.decode(response.bodyBytes))
            .forEach((json) => chatrooms.add(Chatroom.fromJson(json)));
      }
    }
    return chatrooms;
  }
}
