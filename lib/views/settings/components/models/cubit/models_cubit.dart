import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models_state.dart';
part 'models_cubit.freezed.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit() : super(ModelsState.initial());
}
