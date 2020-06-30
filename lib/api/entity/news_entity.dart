import 'package:flutternews/api/entity/source_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
  SourceEntity source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NewsEntity(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewsEntity.fromJson(Map<String, dynamic> json) => _$NewsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsEntityToJson(this);
}
