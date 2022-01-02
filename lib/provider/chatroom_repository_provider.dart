import 'package:chatapp/repository/chatroom_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatroomRepositoryProvider =
    ChangeNotifierProvider((ref) => ChatroomRepositoryImpl());
