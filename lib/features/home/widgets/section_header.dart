import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.sectionTitle,
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            child: Text(strings.viewAll, style: AppTextStyles.sectionAction),
          ),
        ],
      ),
    );
  }
}
