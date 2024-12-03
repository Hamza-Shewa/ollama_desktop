part of 'models_cubit.dart';

@freezed
class ModelsState with _$ModelsState {
  const factory ModelsState.initial() = _Initial;
  const factory ModelsState.loading() = _Loading;
  const factory ModelsState.loaded(List<AiModel> models) = _Loaded;
  const factory ModelsState.error(String message) = _Error;
}
