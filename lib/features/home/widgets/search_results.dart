import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'coupon_card.dart';
import 'section_title.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.query,
    required this.onlyActive,
    required this.onClearSearch,
  });

  final String query;
  final bool onlyActive;
  final VoidCallback onClearSearch;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final coupons = Coupon.examples.where((coupon) {
      final storeName = coupon.store.localized(strings);
      final categoryName = coupon.category.localized(strings);
      final matchesQuery =
          storeName.contains(query) ||
          categoryName.contains(query) ||
          strings.discountPercent.contains(query);
      return matchesQuery && (!onlyActive || coupon.active);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SectionTitle(strings.searchResults),
          const SizedBox(height: 24),
          if (coupons.isEmpty)
            Column(
              children: [
                const Icon(Icons.search_off_rounded, size: 52),
                const SizedBox(height: 12),
                Text(strings.noSearchResults),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: onClearSearch,
                  child: Text(strings.clearSearchAction),
                ),
              ],
            ),
          for (final coupon in coupons)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AspectRatio(
                aspectRatio: 244 / 162,
                child: CouponCard(coupon: coupon),
              ),
            ),
        ],
      ),
    );
  }
}
