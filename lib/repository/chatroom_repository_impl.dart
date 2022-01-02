import 'package:flutter/foundation.dart';

import 'package:chatapp/model/chatroom_model.dart';
import 'package:chatapp/repository/chatroom_repository.dart';

class ChatroomRepositoryImpl extends ChangeNotifier
    implements ChatroomRepository {
  @override
  late List<Chatroom> chatrooms;

  @override
  Future<void> getChatrooms() {
    // TODO: implement getChatrooms
    throw UnimplementedError();
  }
}
