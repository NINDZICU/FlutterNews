import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_event.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_state.dart';
import 'package:flutternews/blocs/daily_news/bloc.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/screens/details/details_news_screen.dart';
import 'package:flutternews/widgets/item_header_text.dart';
import 'package:flutternews/widgets/news_option_icons.dart';
import 'package:flutternews/widgets/publisher_info.dart';
import 'package:flutternews/widgets/rounded_image.dart';
import 'latest_news_item.dart';
import 'package:flutternews/util/extensions.dart';

List<NewsModel> _savedNews = [];

class DailyNewsScreen extends StatefulWidget {
  @override
  DailyNewsScreenState createState() => DailyNewsScreenState();

}
class DailyNewsScreenState extends State<DailyNewsScreen> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(NewsLoading());

    return RefreshIndicator(
        child: BlocListener<BookmarkBloc, BookmarkState>(
          listener: (context, state) {
            if (state is BookmarkGetSuccess) {
              _savedNews = state.news;
            }
          },
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              _getHeader('Top Stories', 'MORE'),
              _getTopNews(context),
              Container(
                  margin: EdgeInsets.only(top: 32),
                  child: _getHeader('Latest News', 'SEE ALL')),
              _getLatestNews()
            ],
          ),
        ),
        onRefresh: () {
          BlocProvider.of<TopNewsBloc>(context).add(FirstLoading());
          BlocProvider.of<LatestNewsBloc>(context).add(FirstLoading());
          return _refreshCompleter.future;
        });
  }

  Widget _getHeader(String title, String addHeader) => Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(addHeader,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ))
        ],
      ));

  Widget _getTopNews(BuildContext context) {
    return BlocBuilder<TopNewsBloc, NewsState>(builder: (context, state) {
      _refreshCompleter?.complete();
      _refreshCompleter = Completer();
      if (state is NewsInitial) {
        return Center(child: CircularProgressIndicator());
      } else if (state is NewsSuccess) {
        NewsModel topNews = state.news.first;
        return InkWell(
            onTap: () => _clickItem(context, topNews),
            child: Column(
              children: [
                RoundedImage(topNews.imageUrl),
                TopStoriesDetails(topNews),
              ],
            ));
      } else
        return Text('No Data');
    });
  }

  Widget _getLatestNews() {
    return BlocBuilder<LatestNewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsInitial) {
        return Center(child: CircularProgressIndicator());
      } else if (state is NewsSuccess) {
        return Column(
          children: ListTile.divideTiles(
              context: context,
              tiles: state.news.map((news) => LatestNewsItem(news, _savedNews))).toList(),
        );
      } else
        return Text('No Data');
    });
  }

  void _clickItem(BuildContext context, NewsModel news) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext buildContext) {
      return DetailsNewsScreen(news);
    }));
  }
}

class TopStoriesDetails extends StatelessWidget implements BookmarkListener {
  final NewsModel _newsModel;

  TopStoriesDetails(this._newsModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PublisherInfo(
            _newsModel.publisherImageUrl,
            '${_newsModel.publisherName} • ${_newsModel.date.timeAgo}',
            _savedNews.contains(_newsModel),
            this),
        ItemHeaderText(_newsModel.title)
      ],
    );
  }

  @override
  void save(BuildContext context) {
    _savedNews.add(_newsModel);
    BlocProvider.of<BookmarkBloc>(context).add(SaveNews(_newsModel));
  }

  @override
  void delete(BuildContext context) {
    _savedNews.remove(_newsModel);
    BlocProvider.of<BookmarkBloc>(context).add(DeleteNews(_newsModel));
  }
}
