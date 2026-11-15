import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'home_search_bar.dart';

class StickySearchHeader extends StatelessWidget {
  const StickySearchHeader({
    super.key,
    required this.controller,
    required this.onlyActive,
    required this.onChanged,
    required this.onFilter,
    required this.onClearFilter,
  });

  final TextEditingController controller;
  final bool onlyActive;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilter;
  final VoidCallback onClearFilter;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SliverAppBar(
      pinned: true,
      primary: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 3,
      toolbarHeight: onlyActive ? 96 : 60,
      titleSpacing: 0,
      title: Column(
        children: [
          HomeSearchBar(
            controller: controller,
            onlyActive: onlyActive,
            onChanged: onChanged,
            onFilter: onFilter,
          ),
          if (onlyActive)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
                child: InputChip(
                  label: Text(strings.activeCouponsOnly),
                  onDeleted: onClearFilter,
                  deleteButtonTooltipMessage: strings.clearFilter,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
