import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeProductList extends HomeState {
  final List<ProductData> productList;
  final List<BrandData> brandList;

  HomeProductList({
    List<ProductData>? productList,
    List<BrandData>? brandList,
  })  : productList = productList ?? List.empty(),
        brandList = brandList ?? List.empty();
}
