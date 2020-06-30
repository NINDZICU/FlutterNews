import 'package:equatable/equatable.dart';
import 'package:flutternews/model/news_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsFailure extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsModel> news;

  NewsSuccess(this.news);
}
