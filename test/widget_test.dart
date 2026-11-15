import 'dart:io';
import 'dart:ui' as ui;

import 'package:e_ramo_flutter_test/app.dart';
import 'package:e_ramo_flutter_test/features/home/widgets/code_button.dart';
import 'package:e_ramo_flutter_test/features/home/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final font = FontLoader('Zain')
      ..addFont(rootBundle.load('assets/fonts/zain/Zain-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/zain/Zain-Bold.ttf'));
    await font.load();
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await icons.load();
  });

  Future<void> openHome(WidgetTester tester, double width) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(width, 844);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const RepaintBoundary(key: ValueKey('screen'), child: MyApp()),
    );
    await tester.pumpAndSettle();
  }

  for (final width in [320.0, 390.0, 430.0]) {
    testWidgets('Home scrolls without layout errors at width $width', (
      tester,
    ) async {
      await openHome(tester, width);
      final scroll = tester
          .widget<CustomScrollView>(find.byType(CustomScrollView))
          .controller!;
      final bottom = scroll.position.maxScrollExtent;
      for (double offset = 0; offset < bottom + 500; offset += 500) {
        scroll.jumpTo(offset.clamp(0, bottom));
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: 'width=$width offset=$offset',
        );
      }
      expect(find.text('كوبونك الخاص'), findsOneWidget);
    });
  }

  testWidgets('Search filters stores and handles no matches', (tester) async {
    await openHome(tester, 390);
    await tester.enterText(find.byType(TextField), 'نعناع');
    await tester.pumpAndSettle();
    expect(find.byType(CouponCard), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(CouponCard),
        matching: find.text('نعناع'),
      ),
      findsOneWidget,
    );
    await tester.enterText(find.byType(TextField), 'متجر غير موجود');
    await tester.pumpAndSettle();
    expect(find.text('لا توجد كوبونات مطابقة لبحثك'), findsOneWidget);
    await tester.tap(find.byTooltip('مسح البحث'));
    await tester.pumpAndSettle();
    expect(find.text('الكوبونات الأكثر استخدامًا'), findsOneWidget);
  });

  testWidgets('Active filter excludes inactive coupons', (tester) async {
    await openHome(tester, 390);
    await tester.tap(find.byTooltip('تصفية الكوبونات'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SwitchListTile));
    await tester.tap(find.text('تطبيق'));
    await tester.pumpAndSettle();
    expect(find.byType(CouponCard), findsNWidgets(2));
    expect(find.text('المراعي'), findsNothing);
  });

  testWidgets('Coupon sheet displays and copies the sample code', (
    tester,
  ) async {
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await openHome(tester, 390);
    final button = find.byType(CodeButton).first;
    await tester.ensureVisible(button);
    await tester.pumpAndSettle();
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text('NANA25'), findsOneWidget);
    await tester.runAsync(() async {
      await tester.tap(find.text('نسخ الكود'));
    });
    await tester.pumpAndSettle();
    expect(copied, 'NANA25');
    expect(find.text('تم نسخ الكود'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Whole coupon card opens the details sheet', (tester) async {
    await openHome(tester, 390);
    final card = find.byType(CouponCard).first;
    await tester.ensureVisible(card);
    await tester.pumpAndSettle();
    await tester.tap(card);
    await tester.pumpAndSettle();
    expect(find.textContaining('صالح حتى'), findsOneWidget);
    expect(find.text('شروط الاستخدام'), findsOneWidget);
  });

  testWidgets('Back to top button returns to the header', (tester) async {
    await openHome(tester, 390);
    final scroll = tester
        .widget<CustomScrollView>(find.byType(CustomScrollView))
        .controller!;
    scroll.jumpTo(1200);
    await tester.pumpAndSettle();
    final backToTop = find.byTooltip('الرجوع إلى أعلى الصفحة');
    expect(backToTop, findsOneWidget);
    await tester.tap(backToTop);
    await tester.pumpAndSettle();
    expect(scroll.offset, 0);
  });

  if (const bool.fromEnvironment('CAPTURE_HOME')) {
    testWidgets('Capture home for visual review', (tester) async {
      debugDisableShadows = false;
      await openHome(tester, 390);
      final scroll = tester
          .widget<CustomScrollView>(find.byType(CustomScrollView))
          .controller!;
      final offsets = [0.0, 780.0, 1500.0, scroll.position.maxScrollExtent];
      for (var i = 0; i < offsets.length; i++) {
        scroll.jumpTo(offsets[i].clamp(0, scroll.position.maxScrollExtent));
        await tester.pumpAndSettle();
        final boundary = tester.renderObject<RenderRepaintBoundary>(
          find.byKey(const ValueKey('screen')),
        );
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2);
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          await File('/tmp/e_ramo_home_$i.png')
              .writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
      }
      debugDisableShadows = true;
    });
  }
}
