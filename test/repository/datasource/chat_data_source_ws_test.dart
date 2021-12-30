import 'dart:async';

import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/repository/datasource/chat/chat_data_source_ws.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';

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

extension ChangeNotifierTestHelper on ChangeNotifier {
  Future awaitNotifyListeners({
    required Function block,
    int expectedCount = 1,
    int seconds = 2,
  }) async {
    final completer = Completer();
    var notifiedCount = 0;
    addListener(() {
      if (++notifiedCount == expectedCount) {
        completer.complete();
      }
    });
    block();
    return completer.future.timeout(Duration(seconds: seconds));
  }
}
