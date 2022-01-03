import 'package:chatapp/viewmodel/chatroom_select_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatroomList extends HookConsumerWidget {
  const ChatroomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(chatroomSelectViewModelProvider);

    return ListView.builder(
        itemCount: viewmodel.chatrooms.length, //viewmodel.chatrooms.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return Card(
              child: ListTile(
            title: Text(viewmodel.chatrooms[index].name),
            onTap: () =>
                viewmodel.enterChatroom(uuid: viewmodel.chatrooms[index].uuid),
          ));
        });
  }
}
