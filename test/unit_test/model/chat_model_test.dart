import 'package:chatapp/model/chat_model.dart';
import 'package:test/test.dart';

void main() {
  test('toJson with createdAt', () {
    final chat = Chat(body: 'toJson test', userId: 7, createdAt: null);
    var result = chat.toJson();
    expect(result, {"content": "toJson test", "user_id": 7, "CreatedAt": null});
  });
  test('fromJson with createdAt', () {
    final json = {"content": "fromJson test", "user_id": 7, "CreatedAt": null};
    var result = Chat.fromJson(json).toJson();
    expect(
        result, {"content": "fromJson test", "user_id": 7, "CreatedAt": null});
  });
}
