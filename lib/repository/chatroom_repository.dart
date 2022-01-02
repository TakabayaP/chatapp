import 'package:flutter/widgets.dart';

import 'package:chatapp/model/chatroom_model.dart';

abstract class ChatroomRepository extends ChangeNotifier {
  late List<Chatroom> chatrooms;
  //Future<void> postChat(Chat chat);
  Future<void> getChatrooms();
}
