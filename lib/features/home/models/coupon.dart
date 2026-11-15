import '../../../core/design.dart';

enum CouponStore { nana, almarai, shahid }

enum CouponCategory { mobiles, smartHome, grocery, entertainment }

class Coupon {
  const Coupon({
    required this.store,
    required this.code,
    this.active = true,
    this.category = CouponCategory.grocery,
    this.expiryYear = 2026,
    this.expiryMonth = 12,
    this.expiryDay = 31,
    this.verifiedYear = 2026,
    this.verifiedMonth = 11,
    this.verifiedDay = 15,
  });

  final CouponStore store;
  final String code;
  final bool active;
  final CouponCategory category;
  final int expiryYear;
  final int expiryMonth;
  final int expiryDay;
  final int verifiedYear;
  final int verifiedMonth;
  final int verifiedDay;

  DateTime get expiresAt => DateTime(expiryYear, expiryMonth, expiryDay);
  DateTime get verifiedAt => DateTime(verifiedYear, verifiedMonth, verifiedDay);

  String get logo => switch (store) {
    CouponStore.nana => AppAssets.nana,
    CouponStore.almarai => AppAssets.almarai,
    CouponStore.shahid => AppAssets.shahid,
  };

  static const examples = [
    Coupon(store: CouponStore.nana, code: 'NANA25'),
    Coupon(store: CouponStore.almarai, code: 'MARAI25', active: false),
    Coupon(
      store: CouponStore.shahid,
      code: 'SHAHID25',
      category: CouponCategory.entertainment,
    ),
  ];
}
