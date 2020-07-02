// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseEntity _$ResponseEntityFromJson(Map<String, dynamic> json) {
  return ResponseEntity(
    status: json['status'] as String,
    totalResults: json['totalResults'] as int,
    articles: (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : NewsEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseEntityToJson(ResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
