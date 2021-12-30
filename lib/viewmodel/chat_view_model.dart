import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/repository/chat_repository.dart';
import 'package:chatapp/provider/chat_repository_provider.dart';

final chatViewModelProvider = ChangeNotifierProvider(
    (ref) => ChatViewModel(ref.watch(chatRepositoryProvider)));

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this._repository) {
    _chats = _repository.chats;
    _repository.addListener(() {
      _chats = _repository.chats;
    });
  }

  final ChatRepository _repository;
  List _chats = [];
  List get chats => _chats;
  Future<void> getChats() async {
    _repository.getChats();
  }

  Future<void> postChats(String body) async {
    _repository.postChats(body);
  }
}
