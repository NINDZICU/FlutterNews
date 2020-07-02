import 'package:floor/floor.dart';
import 'news_entity.dart';

@dao
abstract class NewsDao {
  @Query('SELECT * FROM news')
  Future<List<NewsEntity>> findAllNews();

  @insert
  Future<void> insertNews(NewsEntity news);

  @Query('DELETE FROM news WHERE title = :news AND date = :date')
  Future<void> deleteNews(String title, String date);
}
