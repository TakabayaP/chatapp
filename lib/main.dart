import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:chatapp/widget/chatBubble.dart';

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
  final TextEditingController inputField = TextEditingController();
  StreamController<List> posts = StreamController<List>();
  Future<List<dynamic>> _getPosts() async {
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

  Future<void> _postPosts(String body) async {
    await http.post(
      Uri.http('127.0.0.1:8080', '/post'),
      headers: {"Content-Type": "application/json"},
      body: '{"content":"$body","user_id":5}',
    );
  }

  @override
  void initState() {
    _getPosts();
    super.initState();
  }

  void _sendTextField(String text) {
    if (inputField.text != "") {
      _postPosts(text);
      inputField.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: StreamBuilder<List>(
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 55),
                      itemBuilder: (BuildContext context, index) {
                        return chatBubble(snapshot.data![index]['content'],
                            snapshot.data![index]['user_id']);
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              stream: posts.stream,
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: inputField,
                    decoration: const InputDecoration(
                        hintText: "Type message...",
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true),
                    onSubmitted: _sendTextField,
                  )),
                  FloatingActionButton(
                    onPressed: () {
                      _sendTextField(inputField.text);
                    },
                    child:
                        const Icon(Icons.send, color: Colors.white, size: 18),
                    backgroundColor: Colors.blue,
                  )
                ],
              ))
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
