import 'package:shoes_mall/data/database/local_database.dart';
import 'package:shoes_mall/data/repository/database_data_source_impl.dart';
import 'package:shoes_mall/data/repository/datastore_data_source_impl.dart';
import 'package:shoes_mall/data/repository/network_data_source_impl.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/domain/repository/database_data_source.dart';
import 'package:shoes_mall/domain/repository/datastore_data_source.dart';
import 'package:shoes_mall/domain/repository/network_data_source.dart';


Repository repository() {
  final database = DatabaseDataSourceImpl(localDatabase: LocalDatabase());
  final dataStore = DataStoreDataSourceImpl();
  final network = networkDataSourceImpl();
  return Repository(
    database: database,
    dataStore: dataStore,
    network: network,
  );
}

class Repository {
  final DatabaseDataSource _database;
  final DataStoreDataSource _dataStore;
  final NetworkDataSource _network;

  Repository({
    required DatabaseDataSource database,
    required DataStoreDataSource dataStore,
    required NetworkDataSource network,
  })
      : _network = network,
        _dataStore = dataStore,
        _database = database;

  Future<UserData> login({
    required String userid,
    required String passwd,
  }) async {
    final loginData = {'username': userid, 'password': passwd};

    return await _network.login(loginData);
  }

  Future<List<BrandData>> getBrands() {
    return _database.getBrands();
  }

  Future<List<ProductData>> getProducts() {
    return _database.getProducts();
  }
}
