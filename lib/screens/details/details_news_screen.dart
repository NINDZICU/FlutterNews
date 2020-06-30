import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/widgets/black_icon.dart';
import 'package:flutternews/widgets/image_network_handle.dart';
import 'package:flutternews/util/extensions.dart';

class DetailsNewsScreen extends StatelessWidget {
  final NewsModel news;

  DetailsNewsScreen(this.news);

  @override
  Widget build(BuildContext context) {
    final Widget headerBlock = Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AdvancedNetworkImage(news.publisherImageUrl ?? "",
                fallbackAssetImage: 'images/lake.jpg'),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(news.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, height: 1.3))),
          Divider(height: 24, indent: 64, endIndent: 64, thickness: 1.3),
          Text('Published'),
          Text(news.date.fullDate, style: TextStyle(color: Colors.grey))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: BlackIcon(Icons.share), onPressed: null),
          IconButton(icon: BlackIcon(Icons.bookmark_border), onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
          headerBlock,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ImageNetworkHandle(news.imageUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(news.details),
          )
        ],
      ),
    );
  }
}
