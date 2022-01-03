import 'package:flutter/foundation.dart';

import 'package:chatapp/model/chatroom_model.dart';
import 'package:chatapp/repository/chatroom_repository.dart';
import 'package:chatapp/repository/datasource/chatroom/chatroom_data_source.dart';

class ChatroomRepositoryImpl extends ChangeNotifier
    implements ChatroomRepository {
  ChatroomRepositoryImpl({required this.dataSource});
  final ChatroomDataSource dataSource;
  @override
  List<Chatroom> chatrooms = [];

  @override
  void getChatrooms() async {
    chatrooms = await dataSource.getChatrooms();
    notifyListeners();
  }
}
