import 'package:chatapp/widget/chatBubble.dart';
import 'package:flutter/material.dart';

Widget chatList(data) {
  return ListView.builder(
      itemCount: data!.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10, bottom: 55),
      itemBuilder: (BuildContext context, index) {
        return chatBubble(data![index]['content'], data![index]['user_id']);
      });
}
