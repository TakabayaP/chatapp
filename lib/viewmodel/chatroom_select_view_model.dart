import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/repository/chatroom_repository.dart';
import 'package:chatapp/repository/mock_chatroom_repository.dart';

final chatroomSelectViewModelProvider = ChangeNotifierProvider(
    (ref) => ChatroomSelectViewModel(repository: ChatroomRepositoryImpl()));

class ChatroomSelectViewModel extends ChangeNotifier {
  ChatroomSelectViewModel({required this.repository}) {
    _chatrooms = repository.chatrooms;
  }
  final ChatroomRepository repository;
  late int userId;
  List _chatrooms = [];
  get chatrooms => _chatrooms;
  void enterChatroom() {
    Get.toNamed('/chat_page', arguments: {'userId': userId});
  }
}
