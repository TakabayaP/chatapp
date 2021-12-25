import 'package:chatapp/view/chat/chat_list.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chatapp/model/communication.dart' as comm;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Go chatapp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter + Go chatapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
