import 'package:flutter/foundation.dart';

import 'package:chatapp/model/chat_model.dart';

abstract class ActiveChatDataSource extends ChangeNotifier {
  Future<void> postChat(Chat chat);
  late Chat newChat;
}
