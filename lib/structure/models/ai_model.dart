import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";

part 'ai_model.g.dart';
part 'ai_model.freezed.dart';

@freezed
@HiveType(typeId: 0)
class AiModel with _$AiModel {
  const factory AiModel({
    @HiveField(0) @Default("") String name,
    @HiveField(1) @Default("") String model,
    @HiveField(2) @Default(0) int size,
    @HiveField(3) @JsonKey(name: "modified_at") required DateTime modifiedAt,
  }) = _AiModel;
  const AiModel._();
  factory AiModel.fromJson(Map<String, dynamic> json) =>
      _$AiModelFromJson(json);
}
