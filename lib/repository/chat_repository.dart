import 'package:chatapp/model/chat_model.dart';
import 'package:flutter/widgets.dart';

abstract class ChatRepository extends ChangeNotifier {
  late List<Chat> chats;
  Future<void> postChats(String body);
  Future<void> getChats();
}
