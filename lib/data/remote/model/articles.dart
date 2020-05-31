import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newsflutter/data/data.dart';

part 'articles.g.dart';

@JsonSerializable()
class Articles extends Equatable {
  @JsonKey(name: "source")
  final Source source;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "urlToImage")
  final String urlToImage;

  @JsonKey(name: "publishedAt")
  final DateTime publishedAt;

  @JsonKey(name: "content")
  final String content;

  const Articles(this.source, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content);

  @override
  List<Object> get props =>
      [source, title, description, url, urlToImage, publishedAt, content];

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

  @override
  String toString() {
    return 'Articles{source: $source, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }
}
