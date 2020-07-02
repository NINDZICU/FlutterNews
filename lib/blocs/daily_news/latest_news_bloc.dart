import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/data/repository/news_repository.dart';
import 'bloc.dart';
import 'package:http/http.dart' as http;

class LatestNewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  http.Client _httpClient = http.Client();

  LatestNewsBloc(this._newsRepository);

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FirstLoading) {
      yield NewsInitial();
      final news = await _getNews();
      yield NewsSuccess(news);
    }
  }

  Future<List<NewsModel>> _getNews() async {
    return _newsRepository.getLatestNews().then((value) => value
        .map((news) => NewsModel(news.title, news.urlToImage, news.urlToImage,
            news.source.name, news.publishedAt, news.description))
        .toList());
  }

  Future<List<NewsModel>> _fetchPosts(int startIndex, int limit) async {
    final response = await _httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return NewsModel(rawPost['title'], 'images/lake.jpg', 'images/lake.jpg',
            "BBC", "date", "details about news");
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
