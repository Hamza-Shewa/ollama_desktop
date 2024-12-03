// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AiResponseAdapter extends TypeAdapter<AiResponse> {
  @override
  final int typeId = 1;

  @override
  AiResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AiResponse(
      name: fields[0] as String,
      response: fields[1] as String,
      context: (fields[2] as List).cast<int>(),
      isUser: fields[3] as bool,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AiResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.response)
      ..writeByte(2)
      ..write(obj.context)
      ..writeByte(3)
      ..write(obj.isUser)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
