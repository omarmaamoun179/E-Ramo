import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'models/coupon.dart';
import 'models/coupon_localization.dart';
import 'widgets/collection_sheet.dart';
import 'widgets/filter_sheet.dart';
import 'widgets/home_body.dart';
import 'widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  final _personalKey = GlobalKey();
  final _brandsKey = GlobalKey();
  final _recentKey = GlobalKey();
  bool _onlyActive = false;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final shouldShow = _scrollController.offset > 700;
    if (shouldShow != _showBackToTop) {
      setState(() => _showBackToTop = shouldShow);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void _goTo(GlobalKey key) {
    FocusScope.of(context).unfocus();
    if (_searchController.text.isNotEmpty || _onlyActive) {
      setState(() {
        _searchController.clear();
        _onlyActive = false;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetContext = key.currentContext;
      if (targetContext == null) return;
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _showCategory(CouponCategory category) {
    final strings = AppLocalizations.of(context);
    final coupons = Coupon.examples
        .where((coupon) => coupon.category == category)
        .toList();
    showCouponCollection(
      context,
      title: category.localized(strings),
      coupons: coupons,
    );
  }

  void _showBrand(Coupon coupon) {
    final strings = AppLocalizations.of(context);
    showCouponCollection(
      context,
      title: strings.couponsForStore(coupon.store.localized(strings)),
      coupons: [coupon],
    );
  }

  void _showNanaCoupons() {
    final strings = AppLocalizations.of(context);
    showCouponCollection(
      context,
      title: strings.couponsForStore(strings.storeNana),
      coupons: [Coupon.examples.first],
    );
  }

  void _showAllCoupons(String title) {
    showCouponCollection(context, title: title, coupons: Coupon.examples);
  }

  void _showNotifications() {
    final strings = AppLocalizations.of(context);
    showCouponCollection(
      context,
      title: strings.notifications,
      coupons: const [],
      emptyMessage: strings.noNotifications,
    );
  }

  Future<void> _showFilter() async {
    final result = await showCouponFilter(context, _onlyActive);
    if (result != null && mounted) {
      setState(() => _onlyActive = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      drawer: HomeDrawer(
        onBrands: () => _goTo(_brandsKey),
        onRecent: () => _goTo(_recentKey),
        onPersonal: () => _goTo(_personalKey),
      ),
      body: HomeBody(
        scrollController: _scrollController,
        searchController: _searchController,
        onlyActive: _onlyActive,
        brandsKey: _brandsKey,
        recentKey: _recentKey,
        personalKey: _personalKey,
        onSearchChanged: (_) => setState(() {}),
        onFilter: _showFilter,
        onClearFilter: () => setState(() => _onlyActive = false),
        onNotifications: _showNotifications,
        onCategory: _showCategory,
        onBrand: _showBrand,
        onNanaExplore: _showNanaCoupons,
        onPersonalExplore: () => _goTo(_personalKey),
        onViewAll: _showAllCoupons,
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              tooltip: strings.backToTop,
              onPressed: _scrollToTop,
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            )
          : null,
    );
  }
}
