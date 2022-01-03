// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chatroom _$ChatroomFromJson(Map<String, dynamic> json) => Chatroom(
      id: json['Id'] as int?,
      uuid: json['Uuid'] as String,
      name: json['Name'] as String,
    );

Map<String, dynamic> _$ChatroomToJson(Chatroom instance) => <String, dynamic>{
      'Id': instance.id,
      'Uuid': instance.uuid,
      'Name': instance.name,
    };
