import 'package:flutter/material.dart';

import '../../../core/design.dart';
import 'grocery_banner.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _controller = PageController(viewportFraction: .82, initialPage: 1);
  int _currentPage = 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxWidth * .78 * 531 / 996 + 20,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: 3,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GroceryBanner(onExplore: widget.onExplore),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var index = 0; index < 3; index++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: index == _currentPage ? 18 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? AppColors.green
                          : AppColors.muted.withValues(alpha: .35),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
