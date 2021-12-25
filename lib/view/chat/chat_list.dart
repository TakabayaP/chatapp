import 'dart:async';
import 'package:chatapp/widget/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key, required this.stream}) : super(key: key);
  final Stream<List> stream;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<List>(
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 55),
                itemBuilder: (BuildContext context, index) {
                  return ChatBubble(
                      body: snapshot.data![index]['content'],
                      id: snapshot.data![index]['user_id']);
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        stream: stream,
      ),
    );
  }
}
