import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/common/router/go_router.dart';
import 'package:shoes_mall/domain/model/brand_data.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/presentation/screen/detail/detail_screen.dart';
import 'package:shoes_mall/presentation/screen/home/component/home_search.dart';
import 'package:shoes_mall/presentation/screen/home/component/top_brands.dart';
import 'package:shoes_mall/presentation/screen/home/view_model/home_view_model.dart';

import 'component/home_top_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    print(viewModel.products.length.toString());

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const HomeTopBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          HomeSearch(onChange: (value) {}),
          renderSizeBox(height: 24),
          renderTitle('Top Brands'),
          renderSizeBox(height: 16),
          TopBrands(brands: viewModel.brands),
          renderSizeBox(height: kPadding),
          renderTitle('Popular'),
          renderSizeBox(height: kPadding),
          PopularList(
            products: viewModel.products,
            onClick: (value) {
              ref.read(goRouterProvider).pushNamed(
                    DetailScreen.routeName,
                    extra: value,
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget renderSizeBox({double height = 0, double width = 0}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }

  Widget renderTitle(String title, {double fontSize = 20}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

class PopularList extends StatelessWidget {
  final List<ProductData> products;
  final ValueChanged<ProductData> onClick;

  const PopularList({
    required this.products,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (context, index) => Transform.translate(
                  offset: Offset(0.0, index.isOdd ? 37.0 : 0.0),
                  child: renderProductItem(
                    productData: products[index],
                    onClick: onClick,
                  ),
                ),
            childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
      ),
    );
  }

  Widget renderProductItem({
    required ProductData productData,
    required ValueChanged<ProductData> onClick,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Container(
            height: 175,
            width: 168,
            color: kSecondaryColor,
            child: InkWell(
              onTap: () => onClick(productData),
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productData.image),
                  ),
                ),
                child: Transform.translate(
                  offset: const Offset(-25, -10),
                  child: Image.asset(
                    productData.brandImage,
                    height: 29,
                    width: 47,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '${productData.price}',
          style: const TextStyle(
            fontSize: 22.0,
            color: kProductPriceColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          productData.title,
          style: const TextStyle(
            fontSize: 22.0,
            color: kProductTitleColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
