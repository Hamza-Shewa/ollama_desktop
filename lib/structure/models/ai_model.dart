import "package:freezed_annotation/freezed_annotation.dart";

part 'ai_model.g.dart';
part 'ai_model.freezed.dart';

@freezed
class AiModel with _$AiModel {
  const factory AiModel({
    @Default("") String name,
    @Default("") String model,
    @Default(0) int size,
    @JsonKey(name: "modified_at") required DateTime modifiedAt,
  }) = _AiModel;
  const AiModel._();
  factory AiModel.fromJson(Map<String, dynamic> json) =>
      _$AiModelFromJson(json);
}
