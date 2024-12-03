import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:ollama_desktop/structure/models/ai_response.dart";

part 'chat.g.dart';
part 'chat.freezed.dart';

@freezed
@HiveType(typeId: 2)
class Chat with _$Chat {
  const factory Chat({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @Default("") String model,
    @HiveField(2) @Default([]) List<AiResponse> responses,
  }) = _Chat;
  const Chat._();
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
