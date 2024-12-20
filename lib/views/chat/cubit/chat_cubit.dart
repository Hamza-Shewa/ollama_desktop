import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';
import 'package:ollama_desktop/structure/models/chat.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';
import 'package:uuid/uuid.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());
  final scrollController = ScrollController();
  final aiRepository = getIt<AiRepository>();
  final focusNode = FocusNode();
  List<AiResponse> aiResponses = [];
  final settings = Hive.box('settings');
  final messageController = TextEditingController();
  Future<void> sendMessage() async {
    if (settings.get('model') == null) {
      settings.put('model', 'qwen2.5-coder:latest');
    }
    if (messageController.text.isEmpty) return;

    emit(const ChatState.loading());
    try {
      aiResponses.add(AiResponse(
        response: messageController.text,
        createdAt: DateTime.now(),
        isUser: true,
        context: aiResponses.isNotEmpty ? aiResponses.last.context : [],
      ));
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      messageController.clear();
      final response = await aiRepository.sendMessage({
        "prompt": aiResponses.last.response,
        "model": settings.get('model'),
        "stream": false,
        if (aiResponses.last.context.isNotEmpty)
          "context": aiResponses.last.context,
      });
      aiResponses.add(response);
      emit(ChatState.loaded(aiResponses));
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      focusNode.requestFocus();
    } catch (e) {
      emit(ChatState.error(e.toString()));
    }
  }

  void saveChat() async {
    try {
      await Hive.box('chats').add(Chat(
        id: const Uuid().v4(),
        model: settings.get('model'),
        responses: aiResponses.map((e) => e).toList(),
      ));
      aiResponses.clear();
      messageController.clear();
    } catch (e) {
      print(e);
    }
  }

  void setChat(Chat? chat) async {
    if (chat == null) return;
    emit(const ChatState.loading());
    aiResponses.clear();
    aiResponses.addAll(chat.responses);
    await settings.put('model', chat.model);
    emit(ChatState.loaded(aiResponses));
  }

  bool _isCtrlPressed = false;

  Future onKeyEvent(KeyEvent event) async {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.controlLeft ||
          event.logicalKey == LogicalKeyboardKey.controlRight) {
        _isCtrlPressed = true;
      }
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.controlLeft ||
          event.logicalKey == LogicalKeyboardKey.controlRight) {
        _isCtrlPressed = false;
      }
    }

    if (event is KeyDownEvent &&
        _isCtrlPressed &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      focusNode.unfocus();
      await sendMessage();
      focusNode.requestFocus();
    }
  }
}
