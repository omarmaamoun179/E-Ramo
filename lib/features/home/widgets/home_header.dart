import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onNotifications});

  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) => IconButton(
                tooltip: strings.menuTooltip,
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SizedBox(
                  width: 42,
                  height: 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 2, color: AppColors.lime),
                      Container(height: 1.5, color: AppColors.ink),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(AppAssets.logo, width: 120, height: 40),
            IconButton(
              tooltip: strings.notifications,
              onPressed: onNotifications,
              icon: SizedBox(
                width: 28,
                height: 28,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 2,
                      child: SvgPicture.asset(
                        AppAssets.notification,
                        width: 23,
                        height: 21,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
