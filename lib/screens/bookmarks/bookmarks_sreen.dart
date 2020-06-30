import 'package:flutter/material.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/screens/bookmarks/bookmarks_item.dart';

class BookmarksScreen extends StatelessWidget {
  final List<NewsModel> _newsModels = [
    NewsModel("Pandemic Leaves a Void for Young Athletes Seeking to Make College Teams", 'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg',
        'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg', "The New York Times", "6 June", "Description news"),
    NewsModel("Snapchat will stop promoting President Trump's account", 'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg', 'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg', "1 canal", "17.04.2020","Description news"),
    NewsModel("Coronavirus: Trump 'can't imagine why' US disinfectant calls spiked", 'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg', 'https://vsezhivoe.ru/wp-content/uploads/2017/11/1-1.jpg', "1 canal", "17.04.2020", "Description news")
  ];

  @override
  Widget build(BuildContext context) {
    final divided = ListTile.divideTiles(
      context: context,
        tiles: _newsModels.map((news) => BookmarksItem(news))).toList();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: divided,
    );
  }
}
