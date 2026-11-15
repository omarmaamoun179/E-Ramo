import 'package:flutter/material.dart';

import '../models/coupon.dart';
import 'coupon_card.dart';

class CouponCarousel extends StatelessWidget {
  const CouponCarousel({super.key, this.filled = true});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * .56;
        return SizedBox(
          height: width * 162 / 244,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: Coupon.examples.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) => SizedBox(
              width: width,
              child: CouponCard(coupon: Coupon.examples[index], filled: filled),
            ),
          ),
        );
      },
    );
  }
}
