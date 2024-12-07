import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/models/ai_model.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';

part 'download_models_state.dart';
part 'download_models_cubit.freezed.dart';

class DownloadModelsCubit extends Cubit<DownloadModelsState> {
  DownloadModelsCubit() : super(const DownloadModelsState.initial());
  final repository = getIt<AiRepository>();
}
