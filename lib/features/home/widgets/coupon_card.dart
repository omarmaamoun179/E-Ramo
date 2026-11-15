import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'code_button.dart';
import 'coupon_sheet.dart';
import 'coupon_status.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key, required this.coupon, this.filled = true});

  final Coupon coupon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final storeName = coupon.store.localized(strings);
    return Semantics(
      button: true,
      label: strings.openCouponDetails(storeName),
      child: GestureDetector(
        onTap: () => showCouponSheet(context, coupon),
        child: FittedBox(
          fit: BoxFit.fill,
          child: SizedBox(
            width: 244,
            height: 162,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: filled ? AppColors.green : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: filled ? null : Border.all(color: AppColors.green),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    if (filled) ...[
                      Positioned.fill(
                        child: Image.asset(
                          AppAssets.greenCard,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: SvgPicture.asset(
                          AppAssets.percentPattern,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                    Positioned(
                      right: 0,
                      top: 16,
                      child: Container(
                        width: 92,
                        height: 37,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: filled
                              ? const Color(0xFFD7ECE6)
                              : Colors.white,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                        ),
                        child: Image.asset(coupon.logo, fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 13,
                      child: Text(
                        strings.discountPercent,
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.couponPercent(filled),
                      ),
                    ),
                    Positioned(
                      right: 18,
                      top: 68,
                      child: Text(
                        storeName,
                        style: AppTextStyles.couponStore(filled),
                      ),
                    ),
                    if (!filled)
                      Positioned(
                        left: 16,
                        top: 76,
                        child: Text(
                          strings.discountTerms,
                          style: AppTextStyles.cardTerms,
                        ),
                      ),
                    Positioned(
                      right: 13,
                      bottom: 14,
                      child: CouponStatus(active: coupon.active, light: filled),
                    ),
                    Positioned(
                      left: 17,
                      bottom: 14,
                      child: CodeButton(coupon: coupon),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
