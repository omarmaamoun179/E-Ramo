import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import 'explore_button.dart';

class NewDealsSection extends StatelessWidget {
  const NewDealsSection({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return AspectRatio(
      aspectRatio: 390 / 300,
      child: FittedBox(
        child: SizedBox(
          width: 390,
          height: 300,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 10,
                child: Image.asset(AppAssets.starburst, width: 96),
              ),
              Positioned(
                top: 9,
                left: 0,
                right: 0,
                child: Text(
                  strings.newDeals,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.dealsTitle,
                ),
              ),
              Positioned(
                left: -12,
                top: 22,
                child: Image.asset(AppAssets.dealsCart, height: 250),
              ),
              Positioned(
                right: 25,
                top: 82,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 210,
                      child: Text(
                        strings.newDealsDescription,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.dealsBody,
                      ),
                    ),
                    const SizedBox(height: 23),
                    ExploreButton(onPressed: onExplore),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
