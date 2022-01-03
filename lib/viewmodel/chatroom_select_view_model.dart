import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/repository/chatroom_repository.dart';
import 'package:chatapp/provider/chatroom_repository_provider.dart';

final chatroomSelectViewModelProvider = ChangeNotifierProvider((ref) =>
    ChatroomSelectViewModel(repository: ref.watch(chatroomRepositoryProvider)));

class ChatroomSelectViewModel extends ChangeNotifier {
  ChatroomSelectViewModel({required this.repository}) {
    _chatrooms = repository.chatrooms;
  }
  final ChatroomRepository repository;
  late int userId;
  late List _chatrooms;
  get chatrooms => _chatrooms;
  void enterChatroom({required uuid}) {
    Get.toNamed('/chat_page',
        arguments: {'userId': userId, 'chatroomUuid': uuid});
  }
}
