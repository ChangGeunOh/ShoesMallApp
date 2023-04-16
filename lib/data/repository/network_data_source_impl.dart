import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/data/network/local_network.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/domain/repository/network_data_source.dart';

part 'network_data_source_impl.g.dart';

@Riverpod(keepAlive: true)
NetworkDataSource networkDataSource(NetworkDataSourceRef ref) {
  final dio = ref.watch(localNetworkProvider);
  return NetworkDataSource(dio, baseUrl: 'https://dummyjson.com/auth/');
}
