import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/view/chat/chat_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter + Go chatapp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ChatPage(),
    );
  }
}
