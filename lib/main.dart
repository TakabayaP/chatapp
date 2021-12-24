import 'package:chatapp/view/chat/chatList.dart';
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
        children: <Widget>[
          chatList(posts),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPosts,
        child: const Icon(Icons.replay_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

Widget chatBubble(String body, int id) {
  return Column(children: [
    Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[200],
            ),
            child: Text(body))),
    Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text("id:" + id.toString(),
                style: const TextStyle(
                  fontSize: 13,
                ))))
  ]);
}
