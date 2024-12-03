import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static final Dio dio = Dio();

  static Future initConnection() async {
    dio.options.baseUrl = dotenv.env['API_URL']!;
    dio.options.connectTimeout = const Duration(days: 3);
    dio.options.receiveTimeout = const Duration(days: 3);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Response-Type': 'application/json',
    };

    dio.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
          maxWidth: 90,
          enabled: kDebugMode,
        ),
      ],
    );
  }
}
