import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';
import '../models/coupon.dart';
import '../models/coupon_localization.dart';
import 'section_title.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key, required this.onSelected});

  final ValueChanged<Coupon> onSelected;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SizedBox(
      height: 286,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppAssets.brandsPattern, fit: BoxFit.cover),
          ),
          Column(
            children: [
              const SizedBox(height: 18),
              SectionTitle(strings.browseBrands),
              const SizedBox(height: 14),
              for (var row = 0; row < 3; row++)
                BrandRow(row: row, onSelected: onSelected),
            ],
          ),
        ],
      ),
    );
  }
}

class BrandRow extends StatelessWidget {
  const BrandRow({super.key, required this.row, required this.onSelected});

  final int row;
  final ValueChanged<Coupon> onSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width.clamp(0, 600);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 58,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: Coupon.examples.length,
          separatorBuilder: (context, index) => const SizedBox(width: 18),
          itemBuilder: (context, index) {
            final coupon =
                Coupon.examples[(row + index) % Coupon.examples.length];
            return SizedBox(
              width: screenWidth * .72,
              child: BrandCard(coupon: coupon, onTap: () => onSelected(coupon)),
            );
          },
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.coupon, required this.onTap});

  final Coupon coupon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Material(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(coupon.logo, width: 83, height: 35),
              Text(
                coupon.store.localized(strings),
                style: AppTextStyles.brandName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
