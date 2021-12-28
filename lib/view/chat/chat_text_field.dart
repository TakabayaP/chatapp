import 'package:flutter/material.dart';
import 'package:chatapp/model/communication.dart' as comm;

class ChatTextField extends StatelessWidget {
  ChatTextField({Key? key}) : super(key: key);
  final TextEditingController _inputField = TextEditingController();

  void _sendTextField(String text) {
    if (_inputField.text != "") {
      comm.postPosts(text);
      _inputField.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: _inputField,
              decoration: const InputDecoration(
                  hintText: "Type message...",
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true),
              onSubmitted: _sendTextField,
            )),
            FloatingActionButton(
              onPressed: () {
                _sendTextField(_inputField.text);
              },
              child: const Icon(Icons.send, color: Colors.white, size: 18),
              backgroundColor: Colors.blue,
            )
          ],
        ));
  }
}
