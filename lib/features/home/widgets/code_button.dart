import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'coupon_sheet.dart';

class CodeButton extends StatelessWidget {
  const CodeButton({super.key, required this.coupon, this.small = false});

  final Coupon coupon;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Semantics(
      button: true,
      label: strings.showStoreCode(coupon.store.localized(strings)),
      child: Material(
        color: coupon.active ? AppColors.yellow : const Color(0xFFE1E1DD),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: coupon.active ? () => showCouponSheet(context, coupon) : null,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: small ? 7 : 10,
              vertical: 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.discount,
                  width: small ? 13 : 19,
                  height: small ? 13 : 19,
                ),
                const SizedBox(width: 5),
                Text(strings.showCode, style: AppTextStyles.codeButton(small)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
