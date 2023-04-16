import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_datastore.g.dart';

@Riverpod(keepAlive: true)
LocalDataStore localDataStore(LocalDataStoreRef ref) {
  return LocalDataStore();
}

class LocalDataStore {
  // Empty ...
}