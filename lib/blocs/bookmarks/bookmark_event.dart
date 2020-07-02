import 'package:equatable/equatable.dart';
import 'package:flutternews/model/news_model.dart';

abstract class BookmarkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SaveNews extends BookmarkEvent {
  final NewsModel newsModel;

  SaveNews(this.newsModel);
}

class DeleteNews extends BookmarkEvent {
  final NewsModel newsModel;

  DeleteNews(this.newsModel);
}

class NewsLoading extends BookmarkEvent {}
