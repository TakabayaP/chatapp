import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/viewmodel/chat_view_model.dart';
import 'package:chatapp/view/chat/chat_bubble.dart';

class ChatList extends HookConsumerWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(chatViewModelProvider);
    ScrollController scrollController = ScrollController();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (scrollController.offset !=
          scrollController.position.maxScrollExtent) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 1), curve: Curves.easeOutCirc);
      }
    });

    return ListView.builder(
        itemCount: chat.chats.length,
        shrinkWrap: true,
        controller: scrollController,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (BuildContext context, index) {
          return ChatBubble(
              body: chat.chats[index].body, id: chat.chats[index].userId);
        });
  }
}
