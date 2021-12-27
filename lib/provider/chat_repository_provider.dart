import 'package:chatapp/repository/chat_repository_http.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:chatapp/repository/chat_repository.dart';

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryHttp());
