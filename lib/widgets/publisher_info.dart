import 'package:flutter/material.dart';

import 'icon_with_title.dart';
import 'news_option_icons.dart';

class PublisherInfo extends StatelessWidget {
  final String imageUrl;
  final String title;

  PublisherInfo(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconWithTitle(imageUrl, title),
          OptionIcons()
        ],
      ),
    );
  }
}
