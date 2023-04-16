import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/data/repository/database_data_source_impl.dart';
import 'package:shoes_mall/data/repository/datastore_data_source_impl.dart';
import 'package:shoes_mall/data/repository/network_data_source_impl.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/domain/repository/database_data_source.dart';
import 'package:shoes_mall/domain/repository/datastore_data_source.dart';
import 'package:shoes_mall/domain/repository/network_data_source.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
Repository repository(RepositoryRef ref) {
  final database = ref.watch(databaseDataSourceProvider);
  final dataStore = ref.watch(dataStoreDataSourceProvider);
  final network = ref.watch(networkDataSourceProvider);
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
