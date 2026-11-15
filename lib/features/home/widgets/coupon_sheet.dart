import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'coupon_detail_row.dart';

Future<void> showCouponSheet(BuildContext context, Coupon coupon) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: Colors.white,
    builder: (sheetContext) =>
        CouponSheet(coupon: coupon, hostContext: context),
  );
}

class CouponSheet extends StatelessWidget {
  const CouponSheet({
    super.key,
    required this.coupon,
    required this.hostContext,
  });

  final Coupon coupon;
  final BuildContext hostContext;

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: coupon.code));
    if (!context.mounted) return;
    Navigator.pop(context);
    final strings = AppLocalizations.of(hostContext);
    ScaffoldMessenger.of(hostContext)
        .showSnackBar(SnackBar(content: Text(strings.codeCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final storeName = coupon.store.localized(strings);
    final materialStrings = MaterialLocalizations.of(context);
    final expiryDate = materialStrings.formatShortDate(coupon.expiresAt);
    final verifiedDate = materialStrings.formatShortDate(coupon.verifiedAt);
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(coupon.logo, width: 100, height: 44),
            const SizedBox(height: 16),
            Text(
              strings.couponForStore(storeName),
              style: AppTextStyles.sheetTitle,
            ),
            Text(strings.discountTerms),
            const SizedBox(height: 20),
            SelectableText(
              coupon.code,
              textDirection: TextDirection.ltr,
              style: AppTextStyles.couponCode,
            ),
            Text(strings.sampleCode, style: AppTextStyles.mutedCaption),
            const SizedBox(height: 16),
            CouponDetailRow(
              icon: Icons.event_available_rounded,
              text: strings.validUntil(expiryDate),
            ),
            const SizedBox(height: 8),
            CouponDetailRow(
              icon: Icons.verified_outlined,
              text: strings.lastVerified(verifiedDate),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                strings.couponTermsTitle,
                style: AppTextStyles.detailTitle,
              ),
            ),
            const SizedBox(height: 4),
            Text(strings.couponTermsBody, style: AppTextStyles.detailBody),
            const SizedBox(height: 18),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: AppColors.green),
              onPressed: () => _copy(context),
              icon: const Icon(Icons.copy_rounded, size: 18),
              label: Text(strings.copyCode),
            ),
          ],
        ),
      ),
    );
  }
}
