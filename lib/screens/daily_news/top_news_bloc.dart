import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/repository/news_repository.dart';
import './bloc.dart';

class TopNewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  TopNewsBloc(this._newsRepository);

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
    return _newsRepository.getTopNews().then((value) => value
        .map((news) => NewsModel(news.title, news.urlToImage, news.urlToImage,
        news.source.name, news.publishedAt, news.description))
        .toList());
  }
}
