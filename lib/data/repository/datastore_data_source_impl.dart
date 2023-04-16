import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_mall/data/datastore/local_datastore.dart';
import 'package:shoes_mall/domain/repository/datastore_data_source.dart';

part 'datastore_data_source_impl.g.dart';

@Riverpod(keepAlive: true)
DataStoreDataSource dataStoreDataSource(DataStoreDataSourceRef ref) {
  return DataStoreDataSourceImpl();
}

class DataStoreDataSourceImpl extends DataStoreDataSource {
  late SharedPreferences _sharedPreferences;

  DataStoreDataSourceImpl() {
    init();
  }

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


}
