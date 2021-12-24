import 'package:flutter/material.dart';
import 'package:chatapp/model/communication.dart' as comm;

Widget chatTextField() {
  final TextEditingController inputField = TextEditingController();

  void _sendTextField(String text) {
    if (inputField.text != "") {
      comm.postPosts(text);
      inputField.clear();
    }
  }

  return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: inputField,
            decoration: const InputDecoration(
                hintText: "Type message...",
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true),
            onSubmitted: _sendTextField,
          )),
          FloatingActionButton(
            onPressed: () {
              _sendTextField(inputField.text);
            },
            child: const Icon(Icons.send, color: Colors.white, size: 18),
            backgroundColor: Colors.blue,
          )
        ],
      ));
}
