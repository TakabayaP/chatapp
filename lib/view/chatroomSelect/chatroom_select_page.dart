import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/viewmodel/chatroom_select_view_model.dart';

class ChatroomSelect extends HookConsumerWidget {
  const ChatroomSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatroomSelect = ref.watch(chatroomSelectViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Enter Chatroom'),
          onPressed: () {
            chatroomSelect.enterChatroom();
          },
        ),
      ),
    );
  }
}
