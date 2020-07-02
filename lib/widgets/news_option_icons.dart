import 'package:flutter/material.dart';

import 'black_icon.dart';

class OptionIcons extends StatefulWidget {
  final bool _alreadySaved;
  final BookmarkListener _bookmarkListener;

  OptionIcons(this._alreadySaved, this._bookmarkListener);

  @override
  OptionsIconsState createState() => OptionsIconsState(_alreadySaved, _bookmarkListener);
}

class OptionsIconsState extends State<OptionIcons> {
  bool _alreadySaved;
  final BookmarkListener _bookmarkListener;

  OptionsIconsState(this._alreadySaved, this._bookmarkListener);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: BlackIcon(
                _alreadySaved ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              if (_alreadySaved) {
                _bookmarkListener.delete(context);
              } else {
                _bookmarkListener.save(context);
              }
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

abstract class BookmarkListener {
  void save(BuildContext context);
  void delete(BuildContext context);
}
