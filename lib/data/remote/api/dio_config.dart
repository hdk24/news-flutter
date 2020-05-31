import 'package:dio/dio.dart';
import 'package:newsflutter/common/common.dart';

import 'api_config.dart';

class DioConfig{

  static Dio createDio(){
      final options = BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        contentType: "application/json;charset=utf-8",
      );

      var dio = Dio(options);
      dio.interceptors.add(LogInterceptor(responseBody: AppConfig.isDebug));
      return dio;
  }
}