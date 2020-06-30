import 'package:flutter/material.dart';

import 'black_icon.dart';

class OptionIcons extends StatefulWidget {
  @override
  OptionsIconsState createState() => OptionsIconsState();
}

class OptionsIconsState extends State<OptionIcons> {
  bool _alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: BlackIcon(
                _alreadySaved ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              setState(() {
                _alreadySaved = !_alreadySaved;
              });
            }),
        IconButton(
            icon: BlackIcon(
              Icons.more_vert,
            ),
            onPressed: null),
      ],
    );
  }
}
