import 'package:equatable/equatable.dart';
import 'package:flutternews/model/news_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class InitialSearch extends SearchState {}

class SearchSuccess extends SearchState {
  final List<NewsModel> news;

  SearchSuccess(this.news);
}
