// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiResponseImpl _$$AiResponseImplFromJson(Map<String, dynamic> json) =>
    _$AiResponseImpl(
      name: json['name'] as String? ?? "",
      response: json['response'] as String? ?? "",
      context: (json['context'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      isUser: json['isUser'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AiResponseImplToJson(_$AiResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'response': instance.response,
      'context': instance.context,
      'isUser': instance.isUser,
      'created_at': instance.createdAt.toIso8601String(),
    };
