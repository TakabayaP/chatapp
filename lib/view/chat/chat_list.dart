import 'package:chatapp/viewmodel/chat_view_model.dart';
import 'package:chatapp/view/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatList extends HookConsumerWidget {
  const ChatList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(chatViewModelProvider);

    return SingleChildScrollView(
        child: ListView.builder(
            itemCount: chat.posts.length,
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsets.only(top: 10, bottom: 55),
            itemBuilder: (BuildContext context, index) {
              return ChatBubble(
                  body: chat.posts[index]['content'].toString(),
                  id: chat.posts[index]['user_id'] as int);
            }));
  }
}
