import 'package:flutter/material.dart';

import '../../../core/design.dart';
import '../../../l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.onBrands,
    required this.onRecent,
    required this.onPersonal,
  });

  final VoidCallback onBrands;
  final VoidCallback onRecent;
  final VoidCallback onPersonal;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final items = [
      (strings.drawerBrands, onBrands),
      (strings.recentlyAdded, onRecent),
      (strings.personalCoupon, onPersonal),
    ];
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Image.asset(AppAssets.logo, width: 140),
            ),
            for (final item in items)
              ListTile(
                title: Text(item.$1),
                trailing: const Icon(Icons.chevron_left),
                onTap: () {
                  Navigator.pop(context);
                  item.$2();
                },
              ),
          ],
        ),
      ),
    );
  }
}
