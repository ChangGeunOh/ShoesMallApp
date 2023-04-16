import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  DetailViewModelData build() {
    return DetailViewModelData();
  }

  void setColor(int index) {
    state = state.copyWith(indexColor: index);
  }

  void setSize(int index) {
    state = state.copyWith(indexSize: index);
  }
}

class DetailViewModelData {
  final colors = [
    const Color(0xff29695D),
    const Color(0xff5B8EA3),
    const Color(0xff746A36),
    const Color(0xff2E2E2E),
  ];

  final sizes = [
    "M 20",
    "L 16",
    "M 6",
    "S 12",
  ];

  final int indexColor;
  final int? indexSize;

  DetailViewModelData({
    this.indexColor = 0,
    this.indexSize,
  });

  DetailViewModelData copyWith({int? indexColor, int? indexSize}) {
    return DetailViewModelData(
      indexColor: indexColor ?? this.indexColor,
      indexSize: indexSize ?? this.indexSize,
    );
  }

}
