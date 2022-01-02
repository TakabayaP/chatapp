import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/viewmodel/chatroom_select_view_model.dart';
import 'package:chatapp/view/chatroomSelect/chatroom_list.dart';

class ChatroomSelect extends HookConsumerWidget {
  const ChatroomSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(chatroomSelectViewModelProvider);
    final TextEditingController _inputUserId = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Column(
        children: [
          const Expanded(child: ChatroomList()),
          TextField(
            autofocus: true,
            controller: _inputUserId,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Input user id...',
            ),
            onChanged: (text) {
              try {
                int.parse(text);
              } on FormatException {
                print("parse error");
                return;
              }
              viewmodel.userId = int.parse(text);
            },
          ),
          ElevatedButton(
            child: const Text('Enter Chatroom'),
            onPressed: () {
              viewmodel.enterChatroom();
            },
          ),
        ],
      ),
    );
  }
}
