import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";

part 'ai_response.freezed.dart';
part 'ai_response.g.dart';

@freezed
@HiveType(typeId: 1)
class AiResponse with _$AiResponse {
  const factory AiResponse({
    @HiveField(0) @Default("") String name,
    @HiveField(1) @Default("") String response,
    @HiveField(2) @Default([]) List<int> context,
    @HiveField(3) @Default(false) bool isUser,
    @HiveField(4) @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _AiResponse;
  const AiResponse._();
  factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);
}
