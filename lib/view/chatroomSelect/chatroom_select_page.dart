import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/viewmodel/chatroom_select_view_model.dart';

class ChatroomSelect extends HookConsumerWidget {
  const ChatroomSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatroomSelect = ref.watch(chatroomSelectViewModelProvider);
    final TextEditingController _inputUserId = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _inputUserId,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Input user id...',
              ),
            ),
            ElevatedButton(
              child: const Text('Enter Chatroom'),
              onPressed: () {
                try {
                  int.parse(_inputUserId.text);
                } on FormatException {
                  print("parse error");
                  return;
                }
                chatroomSelect.enterChatroom(
                    userId: int.parse(_inputUserId.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
