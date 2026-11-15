import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'code_button.dart';
import 'coupon_status.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({super.key, required this.coupon});

  final Coupon coupon;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .13),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: 160,
          height: 219,
          child: Column(
            children: [
              Container(
                width: 122,
                height: 49,
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Image.asset(coupon.logo),
              ),
              const SizedBox(height: 5),
              Text(
                coupon.store.localized(strings),
                style: AppTextStyles.recommendedStore,
              ),
              Text(
                strings.discountPercent,
                textDirection: TextDirection.ltr,
                style: AppTextStyles.recommendedPercent,
              ),
              Text(strings.discountTerms, style: AppTextStyles.cardTerms),
              const SizedBox(height: 5),
              const CouponStatus(active: true, vertical: true),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFF7BE29),
                        size: 16,
                      ),
                      Text(strings.ratingValue, style: AppTextStyles.rating),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CodeButton(coupon: coupon, small: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
