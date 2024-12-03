import "package:freezed_annotation/freezed_annotation.dart";

part 'ai_response.freezed.dart';
part 'ai_response.g.dart';

@freezed
class AiResponse with _$AiResponse {
  const factory AiResponse({
    @Default("") String name,
    @Default("") String response,
    @Default([]) List<int> context,
    @Default(false) bool isUser,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _AiResponse;
  const AiResponse._();
  factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);
}
