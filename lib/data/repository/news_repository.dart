import 'package:dio/dio.dart';
import 'package:flutternews/data/api/api_client.dart';
import 'package:flutternews/data/api/entity/news_entity.dart';
import 'package:logger/logger.dart';

class NewsRepository {
  final _logger = Logger();
  ApiClient _api;

  NewsRepository() {
    final dio = Dio();
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _api = ApiClient(dio);
  }

  Future<List<NewsEntity>> getTopNews() {
    return _api
        .getTopNews()
        .then((value) => value.articles)
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
      }
    });
  }

  Future<List<NewsEntity>> searchNews(String query) {
    return _api
        .searchNews(query)
        .then((value) => value.articles)
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
      }
    });
  }

  Future<List<NewsEntity>> getLatestNews() {
    return _api
        .getLatestNews()
        .then((value) => value.articles)
        .catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
      }
    });
  }
}
