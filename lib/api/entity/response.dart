import 'package:json_annotation/json_annotation.dart';
import 'news_entity.dart';

part 'response.g.dart';

@JsonSerializable()
class ResponseEntity {
  String status;
  int totalResults;
  List<NewsEntity> articles;

  ResponseEntity({this.status, this.totalResults, this.articles});

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => _$ResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseEntityToJson(this);
}