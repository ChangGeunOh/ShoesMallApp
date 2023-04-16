import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late Repository _repository;

  @override
  HomeViewModelData build() {
    init();
    return HomeViewModelData();
  }

  Future<void> init() async {
    _repository = ref.watch(repositoryProvider);
    final brands = await _repository.getBrands();
    final products = await _repository.getProducts();
    state = state.copyWith(brands: brands, products: products);
  }
}

class HomeViewModelData {
  final List<BrandData> brands;
  final List<ProductData> products;

  HomeViewModelData({
    this.brands = const [],
    this.products = const [],
  });

  HomeViewModelData copyWith({
    List<BrandData>? brands,
    List<ProductData>? products,
  }) {
    return HomeViewModelData(
      brands: brands ?? this.brands,
      products: products ?? this.products,
    );
  }
}
