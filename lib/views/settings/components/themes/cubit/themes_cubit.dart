import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'themes_state.dart';
part 'themes_cubit.freezed.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit() : super(ThemesState.initial());
}
