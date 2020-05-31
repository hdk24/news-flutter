import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/data/remote/api/api_config.dart';
import 'package:newsflutter/data/remote/api/dio_config.dart';
import 'package:newsflutter/data/remote/model/response.dart';
import 'package:newsflutter/data/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{

  ApiService _service;

  NewsRepositoryImpl() {
    _service = ApiService(DioConfig.createDio());
  }

  @override
  Future<BaseResponse> getTopHeadline([String apiKey = ApiConfig.apiKey, String country = ApiConfig.country]) {
    return _service.getTopHeadlines(apiKey, country, "",20,1);
  }

}