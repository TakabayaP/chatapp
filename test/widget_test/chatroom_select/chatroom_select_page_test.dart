import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:chatapp/view/chatroomSelect/chatroom_select_page.dart';
import 'package:chatapp/provider/chatroom_repository_provider.dart';

import 'mock_chatroom_repository.dart';

void main() {
  testWidgets('Test the list view', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      chatroomRepositoryProvider.overrideWithValue(MockChatroomRepository())
      //ChatRepositoryImpl を Implement しないと怒られる 別のファイルに書いてるのに
    ], child: const MaterialApp(home: ChatroomSelect())));
    expect(find.text('test'), findsNWidgets(5));
  });
}
