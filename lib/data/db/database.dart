import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutternews/data/db/news_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'news_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [NewsEntity])
abstract class AppDatabase extends FloorDatabase {
  NewsDao get newsDao;
}
