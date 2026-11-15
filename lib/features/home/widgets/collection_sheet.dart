import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import 'coupon_card.dart';

Future<void> showCouponCollection(
  BuildContext context, {
  required String title,
  required List<Coupon> coupons,
  String? emptyMessage,
}) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => CollectionSheet(
      title: title,
      coupons: coupons,
      emptyMessage: emptyMessage,
    ),
  );
}

class CollectionSheet extends StatelessWidget {
  const CollectionSheet({
    super.key,
    required this.title,
    required this.coupons,
    required this.emptyMessage,
  });

  final String title;
  final List<Coupon> coupons;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .55,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              Text(title, style: AppTextStyles.sheetTitle),
              const SizedBox(height: 24),
              if (coupons.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    emptyMessage ?? strings.noCoupons,
                    textAlign: TextAlign.center,
                  ),
                ),
              for (final coupon in coupons)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AspectRatio(
                    aspectRatio: 244 / 162,
                    child: CouponCard(coupon: coupon),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
