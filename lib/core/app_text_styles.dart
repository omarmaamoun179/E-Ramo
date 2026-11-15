import 'package:flutter/material.dart';

import 'design.dart';

abstract final class AppTextStyles {
  static const body = TextStyle(fontSize: 16, color: AppColors.ink);
  static const sheetTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const couponCode = TextStyle(
    fontSize: 30,
    color: AppColors.green,
    fontWeight: FontWeight.w700,
  );
  static const mutedCaption = TextStyle(color: Colors.grey);
  static const cardTerms = TextStyle(fontSize: 9, color: AppColors.muted);
  static const recommendedStore = TextStyle(
    fontSize: 19,
    color: AppColors.green,
    height: 1.2,
  );
  static const recommendedPercent = TextStyle(
    fontSize: 38,
    color: AppColors.green,
    height: 1.05,
    fontWeight: FontWeight.w700,
  );
  static const rating = TextStyle(fontSize: 9, height: 1);
  static const bannerBody = TextStyle(fontSize: 10.5, height: 1.7);
  static const bannerBold = TextStyle(fontWeight: FontWeight.w700);
  static const dealsTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const dealsBody = TextStyle(fontSize: 15, height: 1.4);
  static const searchInput = TextStyle(fontSize: 15);
  static const searchHint = TextStyle(color: AppColors.muted, fontSize: 13);
  static const category = TextStyle(fontSize: 16);
  static const brandName = TextStyle(fontSize: 17, fontWeight: FontWeight.w700);
  static const sectionTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );
  static const sectionAction = TextStyle(
    fontSize: 14,
    color: AppColors.green,
    fontWeight: FontWeight.w700,
  );
  static const detailTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static const detailBody = TextStyle(fontSize: 14, color: AppColors.muted);
  static const showMore = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 15,
  );
  static const newYearTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    height: 1.5,
  );
  static const newYearSubtitle = TextStyle(color: Colors.white, fontSize: 16);

  static TextStyle couponPercent(bool filled) => TextStyle(
    fontSize: 45,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: filled ? Colors.white : AppColors.green,
  );

  static TextStyle couponStore(bool filled) => TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: filled ? Colors.white : AppColors.green,
  );

  static TextStyle couponStatus({
    required bool vertical,
    required bool light,
    required bool active,
  }) => TextStyle(
    fontSize: vertical ? 11 : 12,
    color: light
        ? Colors.white.withValues(alpha: active ? 1 : .5)
        : AppColors.green,
  );

  static TextStyle codeButton(bool small) =>
      TextStyle(fontSize: small ? 10 : 13, color: AppColors.ink);

  static TextStyle exploreButton(bool compact) =>
      TextStyle(fontSize: compact ? 12 : 16);
}
