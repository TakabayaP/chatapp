import 'package:flutter/foundation.dart';

import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/chat_repository.dart';
import 'package:chatapp/repository/datasource/chat/active_chat_data_source.dart';
import 'package:chatapp/repository/datasource/chat/passive_chat_data_source.dart';

class ChatRepositoryImpl extends ChangeNotifier implements ChatRepository {
  ChatRepositoryImpl(
      {required this.activeChatDataSource,
      required this.passiveChatDataSource}) {
    getChats();
    activeChatDataSource.addListener(() {
      chats.add(activeChatDataSource.newChat);
      notifyListeners();
    });
  }

  @override
  List<Chat> chats = [];

  final ActiveChatDataSource activeChatDataSource;
  final PassiveChatDataSource passiveChatDataSource;

  @override
  Future<void> getChats() async {
    chats = await passiveChatDataSource.getChats();
    notifyListeners();
  }

  @override
  Future<void> postChat(Chat chat) async {
    activeChatDataSource.postChat(chat);
  }
}
