import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class Chat {
  @JsonKey(name: 'content')
  final String body;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'CreatedAt')
  late DateTime? createdAt;
  Chat({
    required this.body,
    required this.userId,
    this.createdAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

// Run flutter packages pub run build_runner build to generate chat_model.g.dart