// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'كودفو';

  @override
  String get storeNana => 'نعناع';

  @override
  String get storeAlmarai => 'المراعي';

  @override
  String get storeShahid => 'شاهد';

  @override
  String get categoryMobiles => 'الجوالات';

  @override
  String get categorySmartHome => 'المنزل الذكي';

  @override
  String get categoryGrocery => 'البقالة';

  @override
  String get categoryEntertainment => 'الترفيه';

  @override
  String get activeCode => 'كود فعال';

  @override
  String get inactiveCode => 'غير فعال';

  @override
  String get discountTerms => '25% للطلبات أكثر من 300 ريال';

  @override
  String get discountPercent => '25%';

  @override
  String get ratingValue => '(4.9)';

  @override
  String get menuTooltip => 'القائمة';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get drawerBrands => 'العلامات التجارية';

  @override
  String get recentlyAdded => 'مضافة حديثًا';

  @override
  String get personalCoupon => 'كوبونك الخاص';

  @override
  String get filterCoupons => 'تصفية الكوبونات';

  @override
  String get searchHint => 'ابحث هنا...';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get mostUsedCoupons => 'الكوبونات الأكثر استخدامًا';

  @override
  String get exploreNow => 'اكتشفها الآن';

  @override
  String get newDeals => 'صفقات جديدة';

  @override
  String get newDealsDescription =>
      'استكشف صفقات جو اوفر\nواحصل على أقوى وأفضل\nالخصومات';

  @override
  String get newYearTitle =>
      'عروض وكوبونات حصرية بمناسبة\nالسنة الميلادية الجديدة';

  @override
  String get offersAndCoupons => 'العروض والكوبونات';

  @override
  String get browseBrands => 'تصفح حسب العلامات التجارية';

  @override
  String get forYou => 'خصيصًا لك';

  @override
  String get showLess => 'عرض أقل';

  @override
  String get showMore => 'عرض المزيد';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get clearFilter => 'إلغاء الفلتر';

  @override
  String get backToTop => 'الرجوع إلى أعلى الصفحة';

  @override
  String get activeCouponsOnly => 'الكوبونات الفعالة فقط';

  @override
  String get apply => 'تطبيق';

  @override
  String get searchResults => 'نتائج البحث';

  @override
  String get noSearchResults => 'لا توجد كوبونات مطابقة لبحثك';

  @override
  String get clearSearchAction => 'مسح البحث والمحاولة مرة أخرى';

  @override
  String get noCoupons => 'لا توجد كوبونات متاحة في هذا القسم حاليًا';

  @override
  String get noNotifications => 'لا توجد إشعارات جديدة';

  @override
  String couponsForStore(String store) {
    return 'كوبونات $store';
  }

  @override
  String couponForStore(String store) {
    return 'كوبون $store';
  }

  @override
  String get sampleCode => 'كود تجريبي لعرض التصميم';

  @override
  String validUntil(String date) {
    return 'صالح حتى $date';
  }

  @override
  String lastVerified(String date) {
    return 'آخر تحقق: $date';
  }

  @override
  String get couponTermsTitle => 'شروط الاستخدام';

  @override
  String get couponTermsBody =>
      'يسري الخصم على الطلبات المؤهلة وقد لا يشمل رسوم التوصيل.';

  @override
  String openCouponDetails(String store) {
    return 'فتح تفاصيل كوبون $store';
  }

  @override
  String get copyCode => 'نسخ الكود';

  @override
  String get codeCopied => 'تم نسخ الكود';

  @override
  String get showCode => 'عرض الكود';

  @override
  String showStoreCode(String store) {
    return 'عرض كود $store';
  }

  @override
  String get groceryBannerIntro => 'نغيّر مفهوم المقاضي مع بعض\n';

  @override
  String get discountUpToFifty => 'بخصومات تصل إلى 50%';
}
