import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.onSelected});

  final ValueChanged<CouponCategory> onSelected;

  static const _categories = [
    (CouponCategory.mobiles, AppAssets.mobile, Color(0xFFE3F1DC)),
    (CouponCategory.smartHome, AppAssets.smartHome, Color(0xFFFFF6DF)),
    (CouponCategory.grocery, AppAssets.grocery, Color(0xFFD9FBF4)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          for (var index = 0; index < _categories.length; index++) ...[
            if (index != 0) const SizedBox(width: 14),
            Expanded(
              child: CategoryCard(
                category: _categories[index],
                onTap: () => onSelected(_categories[index].$1),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.onTap});

  final (CouponCategory, String, Color) category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      elevation: 5,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
          child: Column(
            children: [
              Container(
                width: 76,
                height: 76,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: category.$3,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(category.$2, fit: BoxFit.contain),
              ),
              const SizedBox(height: 7),
              FittedBox(
                child: Text(
                  category.$1.localized(strings),
                  style: AppTextStyles.category,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
