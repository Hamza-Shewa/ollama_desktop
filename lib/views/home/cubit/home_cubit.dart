import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    init();
  }
  final repository = getIt<AiRepository>();

  init() async {
    emit(const HomeState.loading());
    try {
      await repository.getAiModels();
      emit(const HomeState.loaded());
    } catch (e) {
      emit(HomeState.error(
          "You don't have ollama running or even installed".tr()));
    }
  }
}
