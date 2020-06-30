import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/model/news_model.dart';
import 'package:flutternews/screens/details/details_news_screen.dart';
import 'package:flutternews/screens/search/search_event.dart';
import 'package:flutternews/screens/search/search_state.dart';
import 'package:flutternews/screens/search/search_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  SearchBloc _searchBloc;
  List<NewsModel> _news = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    _searchBloc = BlocProvider.of<SearchBloc>(context);

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      _searchBloc.add(QueryEntered(query));

      return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state is InitialSearch) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchSuccess) {
          _news = state.news;
          return _buildList(context);
        } else
          return Container();
      });
    } else {
      return Container();
    }
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
          context: context,
          tiles: _news.map((news) => _buildRow(context, news))).toList(),
    );
  }

  Widget _buildRow(BuildContext context, NewsModel news) {
    return ListTile(
      title: Text(
        news.title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(news.publisherName),
      onTap: () => _clickItem(context, news),
    );
  }

  void _clickItem(BuildContext context, NewsModel news) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext buildContext) {
      return DetailsNewsScreen(news);
    }));
  }
}
