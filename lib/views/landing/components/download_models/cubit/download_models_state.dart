part of 'download_models_cubit.dart';

@freezed
class DownloadModelsState with _$DownloadModelsState {
  const factory DownloadModelsState.initial() = _Initial;
  const factory DownloadModelsState.loading() = _Loading;
  const factory DownloadModelsState.loaded(List<AiModel> models) = _Loaded;
  const factory DownloadModelsState.error() = _Error;
}
