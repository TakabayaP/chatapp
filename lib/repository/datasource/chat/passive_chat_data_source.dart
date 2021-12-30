import 'package:chatapp/model/chat_model.dart';

abstract class PassiveChatDataSource {
  Future<List<Chat>> getChats();
  Future<void> postChat(Chat chat);
}
