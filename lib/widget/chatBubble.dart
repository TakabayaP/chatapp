import 'package:flutter/material.dart';

Widget chatBubble(String body, int id) {
  return Column(children: [
    Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[200],
            ),
            child: Text(body))),
    Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text("id:" + id.toString(),
                style: const TextStyle(
                  fontSize: 13,
                ))))
  ]);
}
