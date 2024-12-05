part of 'landing_cubit.dart';

@freezed
class LandingState with _$LandingState {
  const factory LandingState.initial() = _Initial;
  const factory LandingState.loading() = _Loading;
  const factory LandingState.loaded() = _Loaded;
  const factory LandingState.error(String error) = _Error;
}
