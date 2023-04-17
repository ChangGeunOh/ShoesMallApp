import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_mall/domain/repository/datastore_data_source.dart';

class DataStoreDataSourceImpl extends DataStoreDataSource {
  late SharedPreferences _sharedPreferences;

  DataStoreDataSourceImpl() {
    init();
  }

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


}
