import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_mall/common/const/colors.dart';
import 'package:shoes_mall/data/repository/repository.dart';
import 'package:shoes_mall/domain/model/product_data.dart';
import 'package:shoes_mall/presentation/component/animation_button.dart';
import 'package:shoes_mall/presentation/component/shake_transition.dart';
import 'package:shoes_mall/presentation/screen/detail/bloc/detail_bloc.dart';
import 'package:shoes_mall/presentation/screen/detail/bloc/detail_event.dart';
import 'package:shoes_mall/presentation/screen/detail/bloc/detail_state.dart';

class DetailScreen extends StatelessWidget {
  static String get routePath => '/detail';

  static String get routeName => 'detail';

  final ProductData productData;

  const DetailScreen({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider(
        create: (context) {
          final repository = context.read<Repository>();
          return DetailBloc(repository);
        },
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            return Column(
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
                                itemCount: DetailState.colors.length,
                                itemBuilder: (context, index) {
                                  return ShakeTransition(
                                    duration:
                                        const Duration(milliseconds: 1100),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<DetailBloc>()
                                              .add(OnClickColor(index));
                                          // ref
                                          //     .read(detailViewModelProvider.notifier)
                                          //     .setColor(index);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              DetailState.colors[index],
                                          child: Center(
                                            child: state.indexColor == index
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
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: kPrimaryColor,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: state.indexSize,
                                    isExpanded: false,
                                    hint: const Text(
                                      "Choose size",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    ),
                                    items: DetailState.sizes
                                        .mapIndexed(
                                          (index, element) => DropdownMenuItem(
                                            value: index,
                                            child: Text(element),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      context
                                          .read<DetailBloc>()
                                          .add(OnClickSize(value));
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
            );
          },
        ),
      ),
    );
  }
}
