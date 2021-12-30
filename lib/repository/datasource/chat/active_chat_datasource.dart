import 'package:chatapp/model/chat_model.dart';
import 'package:flutter/foundation.dart';

abstract class ActiveChatDataSource extends ChangeNotifier {
  Future<void> postChat(Chat chat);
  late Chat newChat;
}
