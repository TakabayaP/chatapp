import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatapp/repository/chat_repository.dart';

class ChatRepositoryHttp implements ChatRepository {
  ChatRepositoryHttp();

  @override
  Future<List> getPosts() async {
    List data = [];
    var url = Uri.http('127.0.0.1:8080', "/post");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      data = json.decode(utf8.decode(response.bodyBytes));
    }
    return data;
  }
}
