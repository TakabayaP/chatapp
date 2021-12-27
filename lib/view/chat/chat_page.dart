import 'package:chatapp/view/chat/chat_list.dart';
import 'package:chatapp/viewmodel/chat_view_model.dart';
import 'package:chatapp/widget/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/model/communication.dart' as comm;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatPage extends HookConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Stack(
        children: <Widget>[ChatList(), ChatTextField()],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.watch(chatViewModelProvider).getPosts();
          },
          child: const Icon(Icons.replay_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
