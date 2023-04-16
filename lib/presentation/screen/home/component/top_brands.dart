import 'package:flutter/material.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';

class TopBrands extends StatelessWidget {
  final List<BrandData> brands;

  const TopBrands({
    required this.brands,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 73,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: brands.map((e) => renderCard(e)).toList(),
        ),
      ),
    );
  }

  Widget renderCard(BrandData brandData) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Container(
        height: 73.0,
        width: 70.0,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(brandData.image),
        ),
      ),
    );
  }
}