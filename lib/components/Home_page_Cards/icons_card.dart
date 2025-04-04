import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IconsCard extends StatelessWidget {
   IconsCard({super.key, required this.icon, required this.title,required this.onTap});
  final String icon;
  final String title;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 90.h,
       child:  Column(
          children: [
            IconButton(
              onPressed:onTap,
              icon: SvgPicture.asset(
                'assets/icons/$icon.svg', // Replace with your SVG file path
                width: 35.w,
                height: 35.w,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
              ),),
            const SizedBox(height: 8),
            Container(
              width: 90.h,
              height: 40.h,
              child: Text(
                title,
                style:  GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: const Color(0xffBADE4F),
                    fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
    );
  }
}
