import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState.initial());
  final aiRepository = getIt<AiRepository>();

  List<AiResponse> aiModels = [];
  final settings = Hive.box('settings');
  final messageController = TextEditingController();
  Future<void> sendMessage() async {
    settings.put('model', 'qwen2.5-coder:latest');
    if (messageController.text.isEmpty) return;

    emit(ChatState.loading());
    try {
      aiModels.add(AiResponse(
        response: messageController.text,
        createdAt: DateTime.now(),
        isUser: true,
        context: aiModels.isNotEmpty ? aiModels.last.context : [],
      ));
      final response = await aiRepository.sendMessage({
        "prompt": messageController.text,
        "model": settings.get('model'),
        "stream": false,
        if (aiModels.last.context.isNotEmpty) "context": aiModels.last.context,
      });

      aiModels.add(response);
      emit(ChatState.loaded(aiModels));
    } catch (e) {
      emit(ChatState.error(e.toString()));
    }
  }
}
