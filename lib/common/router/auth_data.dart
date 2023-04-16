import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/domain/model/user_data.dart';

part 'auth_data.g.dart';

@Riverpod(keepAlive: true)
class AuthData extends _$AuthData {

  // late Repository repository;
  @override
  UserDataBase build() {
    return UserDataLoading();
  }

  void setUserData(UserData userData) {
    state = userData;
  }
}