import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_event.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/screens/details/details_news_screen.dart';
import 'package:flutternews/widgets/icon_with_title.dart';
import 'package:flutternews/widgets/item_header_text.dart';
import 'package:flutternews/widgets/news_option_icons.dart';
import 'package:flutternews/widgets/rounded_image.dart';
import 'package:flutternews/util/extensions.dart';

class BookmarksItem extends StatefulWidget {
  final NewsModel _newsModel;

  BookmarksItem(this._newsModel);

  @override
  BookmarksItemState createState() => BookmarksItemState(_newsModel);
}

class BookmarksItemState extends State<BookmarksItem> implements BookmarkListener {
  final NewsModel _newsModel;

  BookmarksItemState(this._newsModel);

  @override
  Widget build(BuildContext context) {
    return _buildItem(_newsModel);
  }

  Widget _buildItem(NewsModel news) {
    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconWithTitle(news.publisherImageUrl, news.publisherName),
        Padding(
            padding: EdgeInsets.only(top: 8), child: ItemHeaderText(news.title))
      ],
    );

    final rightColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[RoundedImage(news.imageUrl, 100), OptionIcons(true, this)],
    );

    return InkWell(
        onTap: _clickItem,
        child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: leftColumn),
                    rightColumn,
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(news.date.shortDate))
              ],
            )));
  }

  void _clickItem() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext buildContext) {
      return DetailsNewsScreen(_newsModel);
    }));
  }

  @override
  void save(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(SaveNews(_newsModel));
  }

  @override
  void delete(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(DeleteNews(_newsModel));
  }
}
