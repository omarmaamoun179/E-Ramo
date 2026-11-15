import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

class CouponStatus extends StatelessWidget {
  const CouponStatus({
    super.key,
    required this.active,
    this.light = false,
    this.vertical = false,
  });

  final bool active;
  final bool light;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final icon = Container(
      width: vertical ? 19 : 29,
      height: vertical ? 19 : 29,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? AppColors.success : AppColors.red,
      ),
      child: Icon(
        active ? Icons.check_rounded : Icons.close_rounded,
        color: Colors.white,
        size: vertical ? 16 : 26,
      ),
    );
    final label = Text(
      active ? strings.activeCode : strings.inactiveCode,
      style: AppTextStyles.couponStatus(
        vertical: vertical,
        light: light,
        active: active,
      ),
    );
    if (vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(height: 3), label],
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon, const SizedBox(width: 6), label],
    );
  }
}
