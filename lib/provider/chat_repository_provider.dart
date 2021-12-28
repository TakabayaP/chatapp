import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/repository/chat_repository.dart';
import 'package:chatapp/repository/chat_repository_impl.dart';

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryImpl());
