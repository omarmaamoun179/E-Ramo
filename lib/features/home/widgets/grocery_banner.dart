import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import 'explore_button.dart';

class GroceryBanner extends StatelessWidget {
  const GroceryBanner({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return AspectRatio(
      aspectRatio: 996 / 531,
      child: FittedBox(
        child: SizedBox(
          width: 350,
          height: 187,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.bannerCard, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    AppAssets.nanaCart,
                    width: 163,
                    alignment: Alignment.bottomLeft,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                right: 22,
                top: 16,
                child: Image.asset(AppAssets.nana, width: 82, height: 34),
              ),
              Positioned(
                right: 19,
                top: 60,
                child: SizedBox(
                  width: 177,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: strings.groceryBannerIntro),
                        TextSpan(
                          text: strings.discountUpToFifty,
                          style: AppTextStyles.bannerBold,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bannerBody,
                  ),
                ),
              ),
              Positioned(
                left: 24,
                bottom: 31,
                child: ExploreButton(onPressed: onExplore, compact: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
