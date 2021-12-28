import 'package:chatapp/model/chat_model.dart';

abstract class ChatRepository {
  Future<void> postChats(String body);
  Future<List<Chat>> getChats();
}
