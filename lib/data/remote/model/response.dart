import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newsflutter/data/remote/model/articles.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  const BaseResponse([this.status, this.totalResults, this.articles = const []]);

  @override
  List<Object> get props => [status, totalResults, articles];

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  String toString() {
    return 'BaseResponse{status: $status, totalResults: $totalResults, articles: $articles}';
  }

}
