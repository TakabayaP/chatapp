import 'package:chatapp/repository/chat_repository_http.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryHttp());

abstract class ChatRepository {
  Future<List> getPosts();
}
