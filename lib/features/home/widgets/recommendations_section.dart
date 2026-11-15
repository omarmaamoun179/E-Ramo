import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import 'recommended_card.dart';
import 'section_header.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key, required this.onViewAll});

  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Column(
      children: [
        SectionHeader(title: strings.forYou, onViewAll: onViewAll),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
              childAspectRatio: 160 / 219,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => RecommendedCard(
              coupon: Coupon.examples[index % Coupon.examples.length],
            ),
          ),
        ),
      ],
    );
  }
}
