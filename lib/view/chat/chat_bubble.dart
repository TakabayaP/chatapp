import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {Key? key, required this.id, required this.body, required this.showRight})
      : super(key: key);
  final String body;
  final int id;
  final bool showRight;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: showRight ? Alignment.topRight : Alignment.topLeft,
          child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[200],
              ),
              child: Text(body))),
      Align(
          alignment: showRight ? Alignment.topRight : Alignment.topLeft,
          child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text("id:" + id.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                  ))))
    ]);
  }
}
