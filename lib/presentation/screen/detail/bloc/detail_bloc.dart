import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/presentation/screen/detail/bloc/detail_event.dart';
import 'package:shoes_mall/presentation/screen/detail/bloc/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final Repository _repository;

  DetailBloc(Repository repository)
      : _repository = repository,
        super(DetailState()) {
    on<OnClickColor>((event, emit) {
      emit(state.copyWith(indexColor: event.index));
    });

    on<OnClickSize>((event, emit) {
      emit(state.copyWith(indexSize: event.index));
    });
  }
}

