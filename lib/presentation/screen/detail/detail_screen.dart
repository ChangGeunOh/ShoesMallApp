import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/presentation/component/animation_button.dart';
import 'package:shoes_mall/presentation/component/shake_transition.dart';
import 'package:shoes_mall/presentation/screen/detail/view_model/detail_view_model.dart';
import 'package:collection/collection.dart';

class DetailScreen extends ConsumerWidget {
  static String get routePath => '/detail';

  static String get routeName => 'detail';

  final ProductData productData;

  const DetailScreen({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(detailViewModelProvider);
    int _selectedIndex = 0;
    int? _value;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    productData.brandImage,
                    color: const Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                  PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Center(
                          child: ShakeTransition(
                              axis: Axis.horizontal,
                              child: Image.asset(productData.image)));
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 22.0),
                  Text(
                    productData.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 22.0),
                  Text(
                    '\$${productData.price}',
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                      color: kTextLightColor,
                    ),
                  ),
                  Text(
                    productData.description,
                    style: const TextStyle(
                      color: kDescriptionColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  SizedBox(
                    height: 38.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.colors.length,
                          itemBuilder: (context, index) {
                            return ShakeTransition(
                              duration: const Duration(milliseconds: 1100),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(detailViewModelProvider.notifier)
                                        .setColor(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: viewModel.colors[index],
                                    child: Center(
                                      child: viewModel.indexColor == index
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kPrimaryColor,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: viewModel.indexSize,
                              isExpanded: false,
                              hint: const Text(
                                "Choose size",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                              ),
                              items: viewModel.sizes
                                  .mapIndexed(
                                    (index, element) => DropdownMenuItem(
                                      value: index,
                                      child: Text(element),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                ref
                                    .read(detailViewModelProvider.notifier)
                                    .setSize(value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ShakeTransition(
                    axis: Axis.vertical,
                    child: ButtonStates(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("M 20"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("L 16"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("M 6"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("S 12"),
                              ),
                            ]

 */
