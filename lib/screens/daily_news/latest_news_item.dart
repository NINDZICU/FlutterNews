import 'package:flutter/material.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/screens/details/details_news_screen.dart';
import 'package:flutternews/widgets/item_header_text.dart';
import 'package:flutternews/widgets/publisher_info.dart';
import 'package:flutternews/widgets/rounded_image.dart';
import 'package:flutternews/util/extensions.dart';

class LatestNewsItem extends StatefulWidget {
  final NewsModel _newsModel;

  LatestNewsItem(this._newsModel);

  @override
  LatestNewsItemState createState() => LatestNewsItemState(_newsModel);
}

class LatestNewsItemState extends State<LatestNewsItem> {
  final NewsModel _news;

  LatestNewsItemState(this._news);

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  Widget _buildItem() {
    return InkWell(
        onTap: _clickItem,
        child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 3, child: ItemHeaderText(_news.title)),
                    Expanded(child: RoundedImage(_news.imageUrl, 80))
                  ],
                ),
                PublisherInfo(_news.publisherImageUrl,
                    '${_news.publisherName} • ${_news.date.timeAgo} ')
              ],
            )));
  }

  void _clickItem() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext buildContext) {
      return DetailsNewsScreen(_news);
    }));
  }
}
