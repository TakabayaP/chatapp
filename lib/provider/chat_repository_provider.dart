import 'package:chatapp/repository/chat_repository_ws.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatRepositoryProvider =
    ChangeNotifierProvider((ref) => ChatRepositoryWs());
