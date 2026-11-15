import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';

class CouponDetailRow extends StatelessWidget {
  const CouponDetailRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 19, color: AppColors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: AppTextStyles.detailBody)),
      ],
    );
  }
}
