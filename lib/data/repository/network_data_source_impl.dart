import 'package:shoes_mall/data/network/local_network.dart';
import 'package:shoes_mall/domain/repository/network_data_source.dart';


NetworkDataSource networkDataSourceImpl() {
  final dio = localNetwork();
  return NetworkDataSource(dio, baseUrl: 'https://dummyjson.com/auth/');
}
