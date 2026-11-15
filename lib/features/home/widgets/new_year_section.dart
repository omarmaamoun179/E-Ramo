import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import 'coupon_carousel.dart';

class NewYearSection extends StatelessWidget {
  const NewYearSection({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 52),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.newYear),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            strings.newYearTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.newYearTitle,
          ),
          const SizedBox(height: 8),
          Text(strings.offersAndCoupons, style: AppTextStyles.newYearSubtitle),
          const SizedBox(height: 28),
          const CouponCarousel(filled: false),
        ],
      ),
    );
  }
}
