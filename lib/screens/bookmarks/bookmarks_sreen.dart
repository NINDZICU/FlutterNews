import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_bloc.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_event.dart';
import 'package:flutternews/blocs/bookmarks/bookmark_state.dart';
import 'package:flutternews/screens/bookmarks/bookmarks_item.dart';

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(NewsLoading());
    var divided = [];
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        if (state is BookmarkInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BookmarkGetSuccess) {
          divided = ListTile.divideTiles(
              context: context,
              tiles: state.news.map((news) => BookmarksItem(news))).toList();

          return listBookmars(divided);
        } else if (state is BookmarkSuccess) {
          return listBookmars(divided);
        } else
          return Text('No Data');
      },
    );
  }

  Widget listBookmars(List<Widget> elements) => ListView(
  padding: EdgeInsets.symmetric(horizontal: 16),
  children: elements,
  );
}
