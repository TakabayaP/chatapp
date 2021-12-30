import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/repository/chat_repository_impl.dart';
import 'package:chatapp/repository/datasource/chat/chat_data_source_ws.dart';
import 'package:chatapp/repository/datasource/chat/chat_datasource_http.dart';

final chatRepositoryProvider = ChangeNotifierProvider((ref) =>
    ChatRepositoryImpl(
        activeChatDataSource: ChatDataSourceWs(),
        passiveChatDataSource: ChatDataSourceHttp()));
