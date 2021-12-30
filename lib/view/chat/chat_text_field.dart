import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/viewmodel/chat_view_model.dart';

class ChatTextField extends HookConsumerWidget {
  ChatTextField({Key? key}) : super(key: key);
  final TextEditingController _inputField = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _sendTextField(WidgetRef ref, String text) {
    if (_inputField.text != "") {
      ref.read(chatViewModelProvider).postChats(text);
      _inputField.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Expanded(
                child: TextField(
              autofocus: true,
              focusNode: _focusNode,
              controller: _inputField,
              decoration: const InputDecoration(
                  hintText: "Type message...",
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true),
              onSubmitted: (text) => _sendTextField(ref, text),
            )),
            FloatingActionButton(
              onPressed: () {
                _sendTextField(ref, _inputField.text);
              },
              child: const Icon(Icons.send, color: Colors.white, size: 18),
              backgroundColor: Colors.blue,
            )
          ],
        ));
  }
}
