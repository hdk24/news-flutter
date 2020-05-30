
import 'package:newsflutter/data/data.dart';

abstract class NewsRepository{
  Future<BaseResponse> getTopHeadline([
    String apiKey = ApiConfig.apiKey,
    String country = ApiConfig.country
  ]);
}