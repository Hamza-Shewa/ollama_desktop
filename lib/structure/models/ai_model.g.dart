// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AiModelAdapter extends TypeAdapter<AiModel> {
  @override
  final int typeId = 0;

  @override
  AiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AiModel(
      name: fields[0] as String,
      model: fields[1] as String,
      size: fields[2] as int,
      modifiedAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AiModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.modifiedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
