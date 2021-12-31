import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/view/chat/chat_list.dart';
import 'package:chatapp/viewmodel/chat_view_model.dart';
import 'package:chatapp/view/chat/chat_text_field.dart';

class ChatPage extends HookConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Column(
        children: <Widget>[const Expanded(child: ChatList()), ChatTextField()],
      ),
    );
  }
}
