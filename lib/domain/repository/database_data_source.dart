import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';

abstract class DatabaseDataSource {
  Future<List<BrandData>> getBrands();
  Future<List<ProductData>> getProducts();
}