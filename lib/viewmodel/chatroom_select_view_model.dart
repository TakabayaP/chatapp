import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatroomSelectViewModelProvider =
    ChangeNotifierProvider((ref) => ChatroomSelectViewModel());

class ChatroomSelectViewModel extends ChangeNotifier {
  ChatroomSelectViewModel();
  void enterChatroom({required int userId}) {
    Get.toNamed('/chat_page', arguments: {'userId': userId});
  }
}
