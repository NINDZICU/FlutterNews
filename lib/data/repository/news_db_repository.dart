import 'package:flutternews/data/db/news_dao.dart';
import 'package:flutternews/data/db/news_entity.dart';

class NewsDbRepository {
  final NewsDao _newsDao;

  NewsDbRepository(this._newsDao);

  Future<List<NewsEntity>> getSavedNews() {
    return _newsDao.findAllNews();
  }

  Future<void> saveNews(NewsEntity news) {
    return _newsDao.insertNews(news);
  }

  Future<void> deleteNews(NewsEntity news) {
    return _newsDao.deleteNews(news.title, news.date);
  }
}
