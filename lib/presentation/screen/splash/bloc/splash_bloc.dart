import 'package:bloc/bloc.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_event.dart';
import 'package:shoes_mall/presentation/screen/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Repository _repository;

  SplashBloc(Repository repository)
      : _repository = repository,
        super(SplashLoading()) {
    on<SplashCompleted>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      if (state is SplashLoading) {
        emit(SplashComplete());
      }
    });
  }


}


//  ref.read(loginViewModelProvider.notifier).login(userid: 'kminchelle', passwd: '0lelplR');
