import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/data/remote/api/api_config.dart';
import 'package:newsflutter/data/remote/model/response.dart';
import 'package:newsflutter/data/repository/news_repository.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImpl implements NewsRepository{

  Dio _dio;
  ApiService _service;

  NewsRepositoryImpl() {
    _dio = Dio();
    _service = ApiService(_dio);
  }

  @override
  Future<BaseResponse> getTopHeadline([String apiKey = ApiConfig.apiKey, String country = ApiConfig.country]) {
    return _service.getTopHeadlines(apiKey, country, "");
  }

}