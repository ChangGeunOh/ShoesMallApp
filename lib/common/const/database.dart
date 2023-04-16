import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';

const kDatabaseVersion = 6;
const kDatabaseName = 'shoes_db';
const kTableShoes = 'shoes_table';
const kTableBrand = 'brand_table';

List<ProductData> kProducts = [
  ProductData(
    id: 1,
    price: 239.80,
    title: "Nike Air Max 90",
    image: "assets/images/image.png",
    brandImage: 'assets/images/nike_brand.png',
    description:
    "A pillar of sneaker culture, the Nike Air Max 90 remains one of the most significant designs since the brand’s founding. And while its OG colorways are some of the most significant.",
  ),
  ProductData(
    id: 2,
    price: 85.80,
    title: "Adidas Air Max 90",
    image: "assets/images/image1.png",
    brandImage: 'assets/images/adidas_brand.png',
    description:
    "A pillar of sneaker culture, the Nike Air Max 90 remains one of the most significant designs since the brand’s founding. And while its OG colorways are some of the most significant.",
  ),
  ProductData(
    id: 3,
    price: 39,
    title: "Puma Air Max 90",
    image: "assets/images/image2.png",
    brandImage: 'assets/images/puma_brand.png',
    description:
    "A pillar of sneaker culture, the Nike Air Max 90 remains one of the most significant designs since the brand’s founding. And while its OG colorways are some of the most significant.",
  ),
  ProductData(
    id: 4,
    price: 39,
    title: "Jordan Air Max 90",
    image: "assets/images/image4.png",
    brandImage: 'assets/images/jordan_brand.png',
    description:
    "A pillar of sneaker culture, the Nike Air Max 90 remains one of the most significant designs since the brand’s founding. And while its OG colorways are some of the most significant.",
  ),
];

// list of Top Brands
// for our demo
List kBrands = [
  BrandData(id: 1, name: 'nike', image: 'assets/images/nike_brand.png'),
  BrandData(id: 2, name: 'adidas', image: 'assets/images/adidas_brand.png'),
  BrandData(id: 3, name: 'puma', image: 'assets/images/puma_brand.png'),
  BrandData(id: 4, name: 'jordan', image: 'assets/images/jordan_brand.png'),
  BrandData(id: 5, name: 'adidas', image: 'assets/images/adidas_brand.png'),
  BrandData(id: 6, name: 'adidas', image: 'assets/images/adidas_brand.png'),
  BrandData(id: 7, name: 'nike', image: 'assets/images/nike_brand.png'),
];
