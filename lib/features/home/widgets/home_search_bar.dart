import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.onlyActive,
    required this.onChanged,
    required this.onFilter,
  });

  final TextEditingController controller;
  final bool onlyActive;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilter;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFB9B9B9), width: .7),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              tooltip: strings.filterCoupons,
              onPressed: onFilter,
              icon: FilterIcon(active: onlyActive),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                textAlign: TextAlign.center,
                style: AppTextStyles.searchInput,
                decoration: InputDecoration(
                  hintText: strings.searchHint,
                  hintStyle: AppTextStyles.searchHint,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            if (controller.text.isNotEmpty)
              IconButton(
                tooltip: strings.clearSearch,
                onPressed: () {
                  controller.clear();
                  onChanged('');
                },
                icon: const Icon(Icons.close, size: 19),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  AppAssets.search,
                  width: 21,
                  height: 21,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 21,
      height: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final width in [21.0, 13.0, 5.0])
            Container(
              width: width,
              height: 1.4,
              color: active ? AppColors.green : AppColors.lime,
            ),
        ],
      ),
    );
  }
}
