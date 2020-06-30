import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/repository/news_repository.dart';
import 'package:flutternews/screens/daily_news/bloc.dart';
import 'package:flutternews/screens/search/custom_search_delegate.dart';
import 'package:flutternews/screens/bookmarks/bookmarks_sreen.dart';
import 'package:flutternews/screens/daily_news/daily_news_screen.dart';
import 'package:flutternews/screens/settings/settings_screen.dart';
import 'package:flutternews/screens/search/search_bloc.dart';
import 'icons/my_flutter_app_icons.dart';

void main() => runApp(
      MultiRepositoryProvider(
        providers: [RepositoryProvider(create: (context) => NewsRepository())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  LatestNewsBloc(RepositoryProvider.of<NewsRepository>(context))
                    ..add(FirstLoading()),
            ),
            BlocProvider(
              create: (context) =>
                  TopNewsBloc(RepositoryProvider.of<NewsRepository>(context))
                    ..add(FirstLoading()),
            ),
            BlocProvider(
              create: (context) =>
                  SearchBloc(RepositoryProvider.of<NewsRepository>(context)),
            ),
          ],
          child: MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0, actionsIconTheme: IconThemeData(color: Colors.black)),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: Colors.cyan,
        errorColor: Color(0xFFB00020),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;
  static List<Widget> _screens = <Widget>[
    DailyNewsScreen(),
    BookmarksScreen(),
    SettingsScreen()
  ];

  static List<String> _names = <String>['Daily News', 'Bookmarks', 'Settings'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_names[_selectedItem]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: _screens[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.earth),
            title: Text('Daily News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Bookmarks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
