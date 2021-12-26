import 'package:chatapp/widget/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            itemCount: Provider.of<List>(context).length,
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsets.only(top: 10, bottom: 55),
            itemBuilder: (BuildContext context, index) {
              return ChatBubble(
                  body: Provider.of<List>(context)[index]['content'],
                  id: Provider.of<List>(context)[index]['user_id']);
            }));
  }
}
