import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/icons.dart';
import 'custom_bottom_nav_bar_painter.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomBottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.bottomNavBarHeight,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, AppDimens.bottomNavBarHeight),
            painter: CustomBottomNavBarPainter(),
          ),
          Center(
            heightFactor: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(AppIcons.home, 0),
                _buildNavItem(AppIcons.grade, 1),
                _buildNavItem(AppIcons.profile, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(Widget icon, int index) {
    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            widget.selectedIndex == index ? AppColors.green : AppColors.grey100,
            BlendMode.srcIn,
          ),
          child: SizedBox(height: 28, width: 28, child: icon),
        ),
      ),
    );
  }
}
