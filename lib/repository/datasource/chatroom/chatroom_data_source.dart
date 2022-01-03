import 'package:chatapp/model/chatroom_model.dart';

abstract class ChatroomDataSource {
  Future<List<Chatroom>> getChatrooms();
}
