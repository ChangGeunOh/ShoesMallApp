import 'package:shoes_mall/common/const/database.dart';
import 'package:shoes_mall/data/database/local_database.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/domain/repository/database_data_source.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseDataSourceImpl extends DatabaseDataSource {
  late Database database;

  DatabaseDataSourceImpl({
    required LocalDatabase localDatabase,
  }) {
    init(localDatabase);
  }

  Future<void> init(LocalDatabase localDatabase) async {
    database = await localDatabase.database;
  }

  @override
  Future<List<BrandData>> getBrands() async {
    final results = await database.query(kTableBrand);
    return results.map((e) => BrandData.fromJson(e)).toList();
  }

  @override
  Future<List<ProductData>> getProducts() async {
    final results = await database.query(kTableShoes);
    return results.map((e) => ProductData.fromJson(e)).toList();
  }
}
