import 'package:json_annotation/json_annotation.dart';

part 'chatroom_model.g.dart';

@JsonSerializable()
class Chatroom {
  @JsonKey(name: 'Id')
  final int? id;
  @JsonKey(name: 'Uuid')
  final String uuid;
  @JsonKey(name: 'Name')
  final String name;
  Chatroom({
    this.id,
    required this.uuid,
    required this.name,
  });

  factory Chatroom.fromJson(Map<String, dynamic> json) =>
      _$ChatroomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatroomToJson(this);
}
