import 'package:dio/dio.dart' hide Headers;
import 'package:newsflutter/data/remote/api/api_config.dart';
import 'package:newsflutter/data/remote/model/response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

// https://medium.com/flutter-community/dio-interceptors-in-flutter-17be4214f363
// https://medium.com/@IhwanID/implementasi-flutter-dengan-bloc-dio-logging-interceptor-bf63ba2a8114
@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("top-headlines")
  Future<BaseResponse> getTopHeadlines(
    @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("pageSize") int pageSize,
    @Query("page") int page,
  );
}
