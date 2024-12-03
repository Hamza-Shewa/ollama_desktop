part of 'themes_cubit.dart';

@freezed
class ThemesState with _$ThemesState {
  const factory ThemesState.initial() = _Initial;
  const factory ThemesState.loading() = _Loading;
  const factory ThemesState.loaded() = _Loaded;
  const factory ThemesState.error(String message) = _Error;
}
