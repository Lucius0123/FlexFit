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
          _buildNavItem(context,'assets/icons/bottom_bar_icons/Home Switch.svg', 0,23),
          _buildNavItem(context,'assets/icons/workout.svg', 1,23),
          _buildNavItem(context,'assets/icons/community.svg', 2,23),
          GestureDetector(
            onTap: ()=>onTap(3),
            child: Icon(Icons.person,size: 25.h,color:currentIndex == 3? Theme.of(context).colorScheme.onPrimary: Colors.white, )
          )
          
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
