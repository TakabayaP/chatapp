import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> postPosts(String body) async {
  await http.post(
    Uri.http('127.0.0.1:8080', '/post'),
    headers: {"Content-Type": "application/json"},
    body: '{"content":"$body","user_id":5}',
  );
}

Future<List<dynamic>> getPosts(StreamController<List> posts) async {
  List data = [];
  var url = Uri.http('127.0.0.1:8080', "/post");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(json.decode(utf8.decode(response.bodyBytes)));
    data = json.decode(utf8.decode(response.bodyBytes));
  }
  posts.add(data);
  return data;
}
