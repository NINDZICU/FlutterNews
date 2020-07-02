// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDao _newsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `news` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT, `imageUrl` TEXT, `publisherImageUrl` TEXT, `publisherName` TEXT, `date` TEXT, `details` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _newsEntityInsertionAdapter = InsertionAdapter(
            database,
            'news',
            (NewsEntity item) => <String, dynamic>{
                  'id': item.id,
                  'title': item.title,
                  'imageUrl': item.imageUrl,
                  'publisherImageUrl': item.publisherImageUrl,
                  'publisherName': item.publisherName,
                  'date': item.date,
                  'details': item.details
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _newsMapper = (Map<String, dynamic> row) => NewsEntity(
      row['title'] as String,
      row['imageUrl'] as String,
      row['publisherImageUrl'] as String,
      row['publisherName'] as String,
      row['date'] as String,
      row['details'] as String);

  final InsertionAdapter<NewsEntity> _newsEntityInsertionAdapter;

  @override
  Future<List<NewsEntity>> findAllNews() async {
    return _queryAdapter.queryList('SELECT * FROM news', mapper: _newsMapper);
  }

  @override
  Future<void> deleteNews(String title, String date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM news WHERE title = ? AND date = ?',
        arguments: <dynamic>[title, date]);
  }

  @override
  Future<void> insertNews(NewsEntity news) async {
    await _newsEntityInsertionAdapter.insert(news, OnConflictStrategy.abort);
  }
}
