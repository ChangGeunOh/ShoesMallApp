import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_mall/common/const/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Row(
          children: [
            const Text(
              'Sneaks',
              style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/notification_icon.svg'),
          ],
        ),
      ),
    );
  }
}
