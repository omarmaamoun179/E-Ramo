import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import 'banner_carousel.dart';
import 'brands_section.dart';
import 'category_section.dart';
import 'coupon_carousel.dart';
import 'grocery_banner.dart';
import 'new_deals_section.dart';
import 'new_year_section.dart';
import 'recommendations_section.dart';
import 'section_header.dart';

class HomeSections extends StatelessWidget {
  const HomeSections({
    super.key,
    required this.brandsKey,
    required this.recentKey,
    required this.personalKey,
    required this.onCategory,
    required this.onBrand,
    required this.onNanaExplore,
    required this.onPersonalExplore,
    required this.onViewAll,
  });

  final GlobalKey brandsKey;
  final GlobalKey recentKey;
  final GlobalKey personalKey;
  final ValueChanged<CouponCategory> onCategory;
  final ValueChanged<Coupon> onBrand;
  final VoidCallback onNanaExplore;
  final VoidCallback onPersonalExplore;
  final ValueChanged<String> onViewAll;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Column(
      children: [
        const SizedBox(height: 28),
        BannerCarousel(onExplore: onNanaExplore),
        const SizedBox(height: 58),
        CategorySection(onSelected: onCategory),
        const SizedBox(height: 27),
        SectionHeader(
          title: strings.mostUsedCoupons,
          onViewAll: () => onViewAll(strings.mostUsedCoupons),
        ),
        const SizedBox(height: 20),
        const CouponCarousel(),
        const SizedBox(height: 48),
        BrandsSection(key: brandsKey, onSelected: onBrand),
        const SizedBox(height: 44),
        RecommendationsSection(onViewAll: () => onViewAll(strings.forYou)),
        const SizedBox(height: 23),
        SectionHeader(
          key: recentKey,
          title: strings.recentlyAdded,
          onViewAll: () => onViewAll(strings.recentlyAdded),
        ),
        const SizedBox(height: 23),
        const CouponCarousel(filled: false),
        const SizedBox(height: 49),
        const NewYearSection(),
        const SizedBox(height: 27),
        NewDealsSection(onExplore: onPersonalExplore),
        const SizedBox(height: 12),
        SectionHeader(
          key: personalKey,
          title: strings.personalCoupon,
          onViewAll: () => onViewAll(strings.personalCoupon),
        ),
        const SizedBox(height: 24),
        const CouponCarousel(),
        const SizedBox(height: 34),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GroceryBanner(onExplore: onNanaExplore),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
