// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiModelImpl _$$AiModelImplFromJson(Map<String, dynamic> json) =>
    _$AiModelImpl(
      name: json['name'] as String? ?? "",
      model: json['model'] as String? ?? "",
      size: (json['size'] as num?)?.toInt() ?? 0,
      modifiedAt: DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$$AiModelImplToJson(_$AiModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'size': instance.size,
      'modified_at': instance.modifiedAt.toIso8601String(),
    };
