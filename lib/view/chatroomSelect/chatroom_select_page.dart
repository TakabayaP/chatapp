import 'package:chatapp/view/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatroomSelect extends HookConsumerWidget {
  const ChatroomSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Go Chatapp"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Enter Chatroom'),
          onPressed: () {
            Get.toNamed('/chat_page');
          },
        ),
      ),
    );
  }
}
