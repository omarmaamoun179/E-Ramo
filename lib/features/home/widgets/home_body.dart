import 'package:flutter/material.dart';

import '../models/coupon.dart';
import 'home_header.dart';
import 'home_sections.dart';
import 'search_results.dart';
import 'sticky_search_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.scrollController,
    required this.searchController,
    required this.onlyActive,
    required this.brandsKey,
    required this.recentKey,
    required this.personalKey,
    required this.onSearchChanged,
    required this.onFilter,
    required this.onClearFilter,
    required this.onNotifications,
    required this.onCategory,
    required this.onBrand,
    required this.onNanaExplore,
    required this.onPersonalExplore,
    required this.onViewAll,
  });

  final ScrollController scrollController;
  final TextEditingController searchController;
  final bool onlyActive;
  final GlobalKey brandsKey;
  final GlobalKey recentKey;
  final GlobalKey personalKey;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onFilter;
  final VoidCallback onClearFilter;
  final VoidCallback onNotifications;
  final ValueChanged<CouponCategory> onCategory;
  final ValueChanged<Coupon> onBrand;
  final VoidCallback onNanaExplore;
  final VoidCallback onPersonalExplore;
  final ValueChanged<String> onViewAll;

  @override
  Widget build(BuildContext context) {
    final searching = searchController.text.trim().isNotEmpty || onlyActive;
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: CustomScrollView(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverToBoxAdapter(
                child: HomeHeader(onNotifications: onNotifications),
              ),
              StickySearchHeader(
                controller: searchController,
                onlyActive: onlyActive,
                onChanged: onSearchChanged,
                onFilter: onFilter,
                onClearFilter: onClearFilter,
              ),
              SliverToBoxAdapter(
                child: searching
                    ? SearchResults(
                        query: searchController.text.trim(),
                        onlyActive: onlyActive,
                        onClearSearch: () {
                          searchController.clear();
                          onSearchChanged('');
                        },
                      )
                    : HomeSections(
                        brandsKey: brandsKey,
                        recentKey: recentKey,
                        personalKey: personalKey,
                        onCategory: onCategory,
                        onBrand: onBrand,
                        onNanaExplore: onNanaExplore,
                        onPersonalExplore: onPersonalExplore,
                        onViewAll: onViewAll,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
