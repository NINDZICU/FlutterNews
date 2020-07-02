import 'package:equatable/equatable.dart';
import 'package:flutternews/model/news_model.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkSuccess extends BookmarkState {}

class BookmarkGetSuccess extends BookmarkState {
  final List<NewsModel> news;

  BookmarkGetSuccess(this.news);
}

class BookmarkFailure extends BookmarkState {}
