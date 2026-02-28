import 'package:dio/dio.dart';
import 'package:lista_contato/core/secret/app_secret.dart';

class DioService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/classes/',
      headers: {
        "X-Parse-Application-Id": AppSecret.appId,
        "X-Parse-REST-API-Key": AppSecret.apiKey,
        "Content-Type": "application/json",
      },
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  static Dio get instance => _dio;
}
