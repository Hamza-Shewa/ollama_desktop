import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'themes_state.dart';
part 'themes_cubit.freezed.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit() : super(const ThemesState.initial());
  final box = Hive.box('settings');
  updateTheme(String value) async {
    emit(const ThemesState.loading());
    if (box.get('theme', defaultValue: 'light') == value) return;
    box.put('theme', value);
    emit(const ThemesState.loaded());
  }

  String getTheme() => box.get('theme', defaultValue: 'light');
}
