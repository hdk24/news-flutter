import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'articles.g.dart';

@JsonSerializable()
class Articles extends Equatable {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  const Articles(this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content);

  @override
  List<Object> get props => [
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content
  ];

  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}