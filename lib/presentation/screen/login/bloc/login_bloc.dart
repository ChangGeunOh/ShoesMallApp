import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_event.dart';
import 'package:shoes_mall/presentation/screen/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;

  LoginBloc(Repository repository)
      : _repository = repository,
        super(LoginState()) {
    on<UseridEvent>(_useridEvent);
    on<PasswordEvent>(_passwordEvent);
    on<OnLoginEvent>(_onLoginEvent);
  }

  void _useridEvent(UseridEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(userid: event.userid));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginEvent(OnLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    final userData = await _login();
    print(userData.toJson());
    emit(state.copyWith(isLoading: false, isCertified: true));
  }

  Future<UserData> _login() async {
    return await _repository.login(userid: 'kminchelle', passwd: '0lelplR');
  }

}
