import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutternews/blocs/search/search_event.dart';
import 'package:flutternews/blocs/search/search_state.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/data/repository/news_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsRepository _newsRepository;

  SearchBloc(this._newsRepository);

  @override
  SearchState get initialState => InitialSearch();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is QueryEntered) {
      yield InitialSearch();
      List<NewsModel> news = await _searchNews(event.query);
      yield SearchSuccess(news);
    }
  }

  Future<List<NewsModel>> _searchNews(String query) async {
    return _newsRepository.searchNews(query).then((value) => value
        .map((news) => NewsModel(news.title, news.urlToImage, news.urlToImage,
            news.source.name, news.publishedAt, news.description))
        .toList());
  }
}
