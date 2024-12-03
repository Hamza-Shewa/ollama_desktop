import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ollama_desktop/structure/global/dio_helper.dart';
import 'package:ollama_desktop/structure/repositories/ai_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioHelper.dio;
  //initialize repositories
  getIt.registerLazySingleton(() => AiRepository(dio));
}
