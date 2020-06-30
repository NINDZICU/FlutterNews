import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class IconWithTitle extends StatelessWidget {
  final String imageUrl;
  final String title;

  IconWithTitle(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AdvancedNetworkImage(imageUrl ?? "",
              fallbackAssetImage: 'images/lake.jpg'),
        ),
        Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(title, style: TextStyle(fontSize: 11, color: Colors.grey)))
      ],
    );
  }
}
