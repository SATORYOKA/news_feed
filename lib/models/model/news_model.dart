import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(nullable: false)
class News {
  final List<Article> articles;
  News({this.articles});
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable(nullable: false)
class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  @JsonKey(name: 'publishedAt')
  final String publishedDate;
  final String content;

  Article(
      {this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedDate,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
