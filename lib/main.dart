import 'package:chatapp/view/chatroomSelect/chatroom_select_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/view/chat/chat_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter + Go chatapp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ChatroomSelect(),
      getPages: [
        GetPage(
            name: '/chat_page',
            page: () => const ChatPage(),
            transition: Transition.fadeIn)
      ],
    );
  }
}
