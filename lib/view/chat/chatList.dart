import 'dart:async';

import 'package:chatapp/widget/chatBubble.dart';
import 'package:flutter/material.dart';

Widget chatList(StreamController<List> posts) {
  return SingleChildScrollView(
    child: StreamBuilder<List>(
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 55),
              itemBuilder: (BuildContext context, index) {
                return chatBubble(snapshot.data![index]['content'],
                    snapshot.data![index]['user_id']);
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      stream: posts.stream,
    ),
  );
}
