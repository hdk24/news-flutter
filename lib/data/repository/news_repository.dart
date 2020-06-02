
import 'package:newsflutter/data/data.dart';

abstract class NewsRepository{
  Future<BaseResponse> getTopHeadline(String category);
}