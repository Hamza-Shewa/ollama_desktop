import 'package:dio/dio.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ai_repository.g.dart';

@RestApi()
abstract class AiRepository {
  factory AiRepository(Dio dio, {String baseUrl}) = _AiRepository;

  @GET("tags")
  Future<dynamic> getAiModels();

  @POST('generate')
  Future<AiResponse> sendMessage(@Body() Map<String, dynamic> aiModel);
}
