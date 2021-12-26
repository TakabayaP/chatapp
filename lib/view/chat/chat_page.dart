import 'package:chatapp/view/chat/chat_list.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chatapp/model/communication.dart' as comm;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  StreamController<List> posts = StreamController<List>();

  @override
  void initState() {
    comm.getPosts(posts);
    super.initState();
  }

  _getPosts() {
    comm.getPosts(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[ChatList(stream: posts.stream), ChatTextField()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPosts,
        child: const Icon(Icons.replay_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
