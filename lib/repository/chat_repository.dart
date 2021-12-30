import 'package:flutter/widgets.dart';

import 'package:chatapp/model/chat_model.dart';

abstract class ChatRepository extends ChangeNotifier {
  late List<Chat> chats;
  Future<void> postChat(Chat chat);
  Future<void> getChats();
}
