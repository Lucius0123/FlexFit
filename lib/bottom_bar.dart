import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(vertical: 12), // Adjust padding for height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context,'assets/icons/bottom_bar_icons/Home Switch.svg', 0,25),
          _buildNavItem(context,'assets/icons/bottom_bar_icons/Resources Switch.svg', 1,25),
          _buildNavItem(context,'assets/icons/bottom_bar_icons/Stars.svg', 2,25),
          _buildNavItem(context,'assets/icons/bottom_bar_icons/Support & Help Switch.svg', 3,25),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,String iconPath, int index,double size) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        iconPath,
        height: size.h, // Icon size
        width: size.h,
        colorFilter: ColorFilter.mode(currentIndex == index ? Theme.of(context).colorScheme.onPrimary: Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
