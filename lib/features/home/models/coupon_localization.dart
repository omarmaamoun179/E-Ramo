import '../../../l10n/app_localizations.dart';
import 'coupon.dart';

extension CouponStoreLocalization on CouponStore {
  String localized(AppLocalizations strings) => switch (this) {
    CouponStore.nana => strings.storeNana,
    CouponStore.almarai => strings.storeAlmarai,
    CouponStore.shahid => strings.storeShahid,
  };
}

extension CouponCategoryLocalization on CouponCategory {
  String localized(AppLocalizations strings) => switch (this) {
    CouponCategory.mobiles => strings.categoryMobiles,
    CouponCategory.smartHome => strings.categorySmartHome,
    CouponCategory.grocery => strings.categoryGrocery,
    CouponCategory.entertainment => strings.categoryEntertainment,
  };
}
