import 'package:floor/floor.dart';

@Entity(tableName: 'news')
class NewsEntity {
  @PrimaryKey(autoGenerate: true)
  final int id = null;

  final String title;
  final String imageUrl;
  final String publisherImageUrl;
  final String publisherName;
  final String date;
  final String details;

  NewsEntity(this.title, this.imageUrl, this.publisherImageUrl,
      this.publisherName, this.date, this.details);
}