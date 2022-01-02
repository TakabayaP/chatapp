import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/datasource/chat/chat_data_source_ws.dart';
import 'package:test/test.dart';

import '../../../changenotifier_test_helper.dart';

void main() {
  test('postChat test', () async {
    final chatDataSourceWs = ChatDataSourceWs();
    Map<String, dynamic>? result;
    await chatDataSourceWs.awaitNotifyListeners(block: () {
      chatDataSourceWs.postChat(Chat.fromJson({
        'content': 'postChat test',
        'user_id': 7,
      }));
    });
    result = chatDataSourceWs.newChat.toJson();
    expect([result['content'], result['user_id']], ['postChat test', 7]);
  });
}
