import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/common/router/auth_data.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/presentation/screen/login/model/login_view_model_data.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  late Repository _repository;

  @override
  LoginViewModelData build() {
    init();
    return LoginViewModelData();
  }

  Future<void> init() async {
    _repository = ref.watch(repositoryProvider);
  }

  Future<void> login({required String userid, required String passwd}) async {
    final userData = await _repository.login(userid: userid, passwd: passwd);
    ref.read(authDataProvider.notifier).setUserData(userData);
  }
}
