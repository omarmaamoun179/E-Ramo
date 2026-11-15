import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar')];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'كودفو'**
  String get appTitle;

  /// No description provided for @storeNana.
  ///
  /// In ar, this message translates to:
  /// **'نعناع'**
  String get storeNana;

  /// No description provided for @storeAlmarai.
  ///
  /// In ar, this message translates to:
  /// **'المراعي'**
  String get storeAlmarai;

  /// No description provided for @storeShahid.
  ///
  /// In ar, this message translates to:
  /// **'شاهد'**
  String get storeShahid;

  /// No description provided for @categoryMobiles.
  ///
  /// In ar, this message translates to:
  /// **'الجوالات'**
  String get categoryMobiles;

  /// No description provided for @categorySmartHome.
  ///
  /// In ar, this message translates to:
  /// **'المنزل الذكي'**
  String get categorySmartHome;

  /// No description provided for @categoryGrocery.
  ///
  /// In ar, this message translates to:
  /// **'البقالة'**
  String get categoryGrocery;

  /// No description provided for @categoryEntertainment.
  ///
  /// In ar, this message translates to:
  /// **'الترفيه'**
  String get categoryEntertainment;

  /// No description provided for @activeCode.
  ///
  /// In ar, this message translates to:
  /// **'كود فعال'**
  String get activeCode;

  /// No description provided for @inactiveCode.
  ///
  /// In ar, this message translates to:
  /// **'غير فعال'**
  String get inactiveCode;

  /// No description provided for @discountTerms.
  ///
  /// In ar, this message translates to:
  /// **'25% للطلبات أكثر من 300 ريال'**
  String get discountTerms;

  /// No description provided for @discountPercent.
  ///
  /// In ar, this message translates to:
  /// **'25%'**
  String get discountPercent;

  /// No description provided for @ratingValue.
  ///
  /// In ar, this message translates to:
  /// **'(4.9)'**
  String get ratingValue;

  /// No description provided for @menuTooltip.
  ///
  /// In ar, this message translates to:
  /// **'القائمة'**
  String get menuTooltip;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @drawerBrands.
  ///
  /// In ar, this message translates to:
  /// **'العلامات التجارية'**
  String get drawerBrands;

  /// No description provided for @recentlyAdded.
  ///
  /// In ar, this message translates to:
  /// **'مضافة حديثًا'**
  String get recentlyAdded;

  /// No description provided for @personalCoupon.
  ///
  /// In ar, this message translates to:
  /// **'كوبونك الخاص'**
  String get personalCoupon;

  /// No description provided for @filterCoupons.
  ///
  /// In ar, this message translates to:
  /// **'تصفية الكوبونات'**
  String get filterCoupons;

  /// No description provided for @searchHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث هنا...'**
  String get searchHint;

  /// No description provided for @clearSearch.
  ///
  /// In ar, this message translates to:
  /// **'مسح البحث'**
  String get clearSearch;

  /// No description provided for @mostUsedCoupons.
  ///
  /// In ar, this message translates to:
  /// **'الكوبونات الأكثر استخدامًا'**
  String get mostUsedCoupons;

  /// No description provided for @exploreNow.
  ///
  /// In ar, this message translates to:
  /// **'اكتشفها الآن'**
  String get exploreNow;

  /// No description provided for @newDeals.
  ///
  /// In ar, this message translates to:
  /// **'صفقات جديدة'**
  String get newDeals;

  /// No description provided for @newDealsDescription.
  ///
  /// In ar, this message translates to:
  /// **'استكشف صفقات جو اوفر\nواحصل على أقوى وأفضل\nالخصومات'**
  String get newDealsDescription;

  /// No description provided for @newYearTitle.
  ///
  /// In ar, this message translates to:
  /// **'عروض وكوبونات حصرية بمناسبة\nالسنة الميلادية الجديدة'**
  String get newYearTitle;

  /// No description provided for @offersAndCoupons.
  ///
  /// In ar, this message translates to:
  /// **'العروض والكوبونات'**
  String get offersAndCoupons;

  /// No description provided for @browseBrands.
  ///
  /// In ar, this message translates to:
  /// **'تصفح حسب العلامات التجارية'**
  String get browseBrands;

  /// No description provided for @forYou.
  ///
  /// In ar, this message translates to:
  /// **'خصيصًا لك'**
  String get forYou;

  /// No description provided for @showLess.
  ///
  /// In ar, this message translates to:
  /// **'عرض أقل'**
  String get showLess;

  /// No description provided for @showMore.
  ///
  /// In ar, this message translates to:
  /// **'عرض المزيد'**
  String get showMore;

  /// No description provided for @viewAll.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get viewAll;

  /// No description provided for @clearFilter.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء الفلتر'**
  String get clearFilter;

  /// No description provided for @backToTop.
  ///
  /// In ar, this message translates to:
  /// **'الرجوع إلى أعلى الصفحة'**
  String get backToTop;

  /// No description provided for @activeCouponsOnly.
  ///
  /// In ar, this message translates to:
  /// **'الكوبونات الفعالة فقط'**
  String get activeCouponsOnly;

  /// No description provided for @apply.
  ///
  /// In ar, this message translates to:
  /// **'تطبيق'**
  String get apply;

  /// No description provided for @searchResults.
  ///
  /// In ar, this message translates to:
  /// **'نتائج البحث'**
  String get searchResults;

  /// No description provided for @noSearchResults.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد كوبونات مطابقة لبحثك'**
  String get noSearchResults;

  /// No description provided for @clearSearchAction.
  ///
  /// In ar, this message translates to:
  /// **'مسح البحث والمحاولة مرة أخرى'**
  String get clearSearchAction;

  /// No description provided for @noCoupons.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد كوبونات متاحة في هذا القسم حاليًا'**
  String get noCoupons;

  /// No description provided for @noNotifications.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد إشعارات جديدة'**
  String get noNotifications;

  /// No description provided for @couponsForStore.
  ///
  /// In ar, this message translates to:
  /// **'كوبونات {store}'**
  String couponsForStore(String store);

  /// No description provided for @couponForStore.
  ///
  /// In ar, this message translates to:
  /// **'كوبون {store}'**
  String couponForStore(String store);

  /// No description provided for @sampleCode.
  ///
  /// In ar, this message translates to:
  /// **'كود تجريبي لعرض التصميم'**
  String get sampleCode;

  /// No description provided for @validUntil.
  ///
  /// In ar, this message translates to:
  /// **'صالح حتى {date}'**
  String validUntil(String date);

  /// No description provided for @lastVerified.
  ///
  /// In ar, this message translates to:
  /// **'آخر تحقق: {date}'**
  String lastVerified(String date);

  /// No description provided for @couponTermsTitle.
  ///
  /// In ar, this message translates to:
  /// **'شروط الاستخدام'**
  String get couponTermsTitle;

  /// No description provided for @couponTermsBody.
  ///
  /// In ar, this message translates to:
  /// **'يسري الخصم على الطلبات المؤهلة وقد لا يشمل رسوم التوصيل.'**
  String get couponTermsBody;

  /// No description provided for @openCouponDetails.
  ///
  /// In ar, this message translates to:
  /// **'فتح تفاصيل كوبون {store}'**
  String openCouponDetails(String store);

  /// No description provided for @copyCode.
  ///
  /// In ar, this message translates to:
  /// **'نسخ الكود'**
  String get copyCode;

  /// No description provided for @codeCopied.
  ///
  /// In ar, this message translates to:
  /// **'تم نسخ الكود'**
  String get codeCopied;

  /// No description provided for @showCode.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكود'**
  String get showCode;

  /// No description provided for @showStoreCode.
  ///
  /// In ar, this message translates to:
  /// **'عرض كود {store}'**
  String showStoreCode(String store);

  /// No description provided for @groceryBannerIntro.
  ///
  /// In ar, this message translates to:
  /// **'نغيّر مفهوم المقاضي مع بعض\n'**
  String get groceryBannerIntro;

  /// No description provided for @discountUpToFifty.
  ///
  /// In ar, this message translates to:
  /// **'بخصومات تصل إلى 50%'**
  String get discountUpToFifty;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
