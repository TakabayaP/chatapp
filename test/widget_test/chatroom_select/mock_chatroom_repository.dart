import 'package:chatapp/repository/chatroom_repository_impl.dart';
import 'package:flutter/foundation.dart';

import 'package:chatapp/model/chatroom_model.dart';

class MockChatroomRepository extends ChangeNotifier
    implements ChatroomRepositoryImpl {
  @override
  List<Chatroom> chatrooms = [
    Chatroom(uuid: 'aaaaaaaaa', name: 'test'),
    Chatroom(uuid: 'aaaaaaaaa', name: 'test'),
    Chatroom(uuid: 'aaaaaaaaa', name: 'test'),
    Chatroom(uuid: 'aaaaaaaaa', name: 'test'),
    Chatroom(uuid: 'aaaaaaaaa', name: 'test'),
  ];

  @override
  Future<void> getChatrooms() async {}
}
