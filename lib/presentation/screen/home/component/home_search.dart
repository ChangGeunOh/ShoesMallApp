import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_mall/common/const/colors.dart';

class HomeSearch extends StatelessWidget {
  final ValueChanged<String> onChange;
  const HomeSearch({
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: TextField(
            onChanged: onChange,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  width: 10,
                  height: 24,
                ),
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: kSearchColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}