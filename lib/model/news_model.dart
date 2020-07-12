import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String title;
  final String imageUrl;
  final publisherImageUrl;
  final publisherName;
  final String date;
  final String details;

  NewsModel(this.title, this.imageUrl, this.publisherImageUrl,
      this.publisherName, this.date, this.details);

  @override
  List<Object> get props => [title, date];
}
