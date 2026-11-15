import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

Future<bool?> showCouponFilter(BuildContext context, bool initialValue) {
  return showModalBottomSheet<bool>(
    context: context,
    showDragHandle: true,
    backgroundColor: Colors.white,
    builder: (context) => FilterSheet(initialValue: initialValue),
  );
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key, required this.initialValue});

  final bool initialValue;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late bool _onlyActive = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.filterCoupons, style: AppTextStyles.sheetTitle),
            SwitchListTile(
              title: Text(strings.activeCouponsOnly),
              value: _onlyActive,
              activeTrackColor: AppColors.green,
              onChanged: (value) => setState(() => _onlyActive = value),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, _onlyActive),
              child: Text(strings.apply),
            ),
          ],
        ),
      ),
    );
  }
}
