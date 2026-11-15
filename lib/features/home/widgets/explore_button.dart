import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    super.key,
    required this.onPressed,
    this.compact = false,
  });

  final VoidCallback onPressed;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Material(
      color: AppColors.lime,
      elevation: compact ? 0 : 4,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(compact ? 7 : 12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(compact ? 7 : 12),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 12 : 21,
            vertical: compact ? 6 : 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                strings.exploreNow,
                style: AppTextStyles.exploreButton(compact),
              ),
              const SizedBox(width: 10),
              Transform.flip(
                flipX: true,
                child: Icon(Icons.play_arrow_rounded, size: compact ? 18 : 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
