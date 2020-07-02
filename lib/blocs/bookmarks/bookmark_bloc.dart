import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutternews/data/db/news_entity.dart';
import 'package:flutternews/data/repository/news_db_repository.dart';
import 'package:flutternews/model/news_model.dart';

import 'bookmark_event.dart';
import 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final NewsDbRepository _newsRepository;

  BookmarkBloc(this._newsRepository);

  @override
  BookmarkState get initialState => BookmarkInitial();

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    if (event is NewsLoading) {
      yield BookmarkInitial();
      List<NewsModel> news = await _getBookmarks();
      yield BookmarkGetSuccess(news);
    } else if (event is SaveNews) {
      yield BookmarkInitial();
      await _saveNews(event.newsModel);
      yield BookmarkSuccess();
    }
    else if (event is DeleteNews) {
      yield BookmarkInitial();
      await _deleteNews(event.newsModel);
      yield BookmarkSuccess();
    }
  }

  Future<List<NewsModel>> _getBookmarks() async {
    return _newsRepository.getSavedNews().then((value) => value
        .map((news) => NewsModel(news.title, news.imageUrl, news.imageUrl,
            news.publisherName, news.date, news.details))
        .toList());
  }

  Future<void> _saveNews(NewsModel news) async {
    return _newsRepository.saveNews(NewsEntity(news.title, news.imageUrl,
        news.imageUrl, news.publisherName, news.date, news.details));
  }

  Future<void> _deleteNews(NewsModel news) async {
    return _newsRepository.deleteNews(NewsEntity(news.title, news.imageUrl,
        news.imageUrl, news.publisherName, news.date, news.details));
  }
}
