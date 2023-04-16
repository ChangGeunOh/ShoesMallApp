import 'package:path/path.dart';
import 'package:shoes_mall/common/const/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:sqflite/sqflite.dart';

part 'local_database.g.dart';

@Riverpod(keepAlive: true)
LocalDatabase localDatabase(LocalDatabaseRef ref) {
  return LocalDatabase();
}

class LocalDatabase {
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), kDatabaseName);
    return await openDatabase(
      path,
      version: kDatabaseVersion,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.rawQuery('drop table $kTableShoes');
          db.rawQuery('drop table $kTableBrand');
          _onCreate(db, newVersion);
        }
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $kTableShoes (
        id INTEGER PRIMARY KEY,
        price REAL DEFAULT 0.0,
        title TEXT DEFAULT '',
        description TEXT DEFAULT '', 
        image TEXT DEFAULT '', 
        brandImage TEXT DEFAULT '' 
        )''');

    await db.execute('''CREATE TABLE $kTableBrand (
        id INTEGER PRIMARY KEY,
        name TEXT DEFAULT '',
        image TEXT DEFAULT ''
        )''');

    await initData(db);
  }

  Future<void> initData(Database db) async {
    for (var product in kProducts) {
      db.insert(
        kTableShoes,
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    for (BrandData brand in kBrands) {
      db.insert(
        kTableBrand,
        brand.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
