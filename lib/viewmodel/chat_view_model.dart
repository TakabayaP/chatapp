import 'package:chatapp/provider/chat_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:chatapp/repository/chat_repository.dart';

final chatViewModelProvider =
    Provider((ref) => ChatViewModel(ref.watch(chatRepositoryProvider)));

class ChatViewModel extends ChangeNotifier {
  ChatViewModel(this._repository);
  final ChatRepository _repository;
  List _posts = [];
  List get posts => _posts;
  Future<void> getPosts() {
    return _repository
        .getPosts()
        .then((value) => _posts = value)
        .whenComplete(notifyListeners);
  }
}
