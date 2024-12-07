import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/models/ai_model.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';

part 'models_state.dart';
part 'models_cubit.freezed.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit() : super(const ModelsState.initial()) {
    apiController.text = getApiUrl();
    getModels();
  }

  final repository = getIt<AiRepository>();
  final box = Hive.box('settings');
  final apiController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<AiModel> models = [];
  getModels() async {
    emit(const ModelsState.loading());
    try {
      final Map<String, dynamic> response = await repository.getAiModels();
      response['models'].forEach((e) => models.add(AiModel.fromJson(e)));
      emit(ModelsState.loaded(models));
    } catch (e) {
      emit(const ModelsState.error("Error loading models"));
    }
  }

  setModel(String model) async {
    emit(const ModelsState.loading());
    if (box.get('model', defaultValue: 'qwen2.5-coder:latest') == model) return;
    box.put('model', model);
    emit(ModelsState.loaded(models));
  }

  setApiUrl(String url) async {
    emit(const ModelsState.loading());
    if (box.get('url', defaultValue: 'http://localhost:11434/api/') == url) {
      apiController.text = url;
      formKey.currentState!.validate();
      emit(ModelsState.loaded(models));
      return;
    }
    box.put('url', url);
    emit(ModelsState.loaded(models));
  }

  String getModel() => box.get('model', defaultValue: 'qwen2.5-coder:latest');
  String getApiUrl() =>
      box.get('url', defaultValue: 'http://localhost:11434/api/');
}
