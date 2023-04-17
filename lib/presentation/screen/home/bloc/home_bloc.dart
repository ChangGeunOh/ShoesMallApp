import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/presentation/screen/home/bloc/home_event.dart';
import 'package:shoes_mall/presentation/screen/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository _repository;

  HomeState get initialState => HomeLoading();

  HomeBloc(Repository repository)
      : _repository = repository,
        super(HomeLoading()) {
    _init();
  }

  void _init() async {
    final productList = await _repository.getProducts();
    final brandList = await _repository.getBrands();
    emit(HomeProductList(productList: productList, brandList: brandList));
  }
}
