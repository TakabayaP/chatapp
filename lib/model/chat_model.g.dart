// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      body: json['content'] as String,
      userId: json['user_id'] as int,
      createdAt: json['CreatedAt'] == null
          ? null
          : DateTime.parse(json['CreatedAt'] as String),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'content': instance.body,
      'user_id': instance.userId,
      'CreatedAt': instance.createdAt?.toIso8601String(),
    };
