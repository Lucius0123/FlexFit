import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeCard extends StatelessWidget {
   ChallengeCard({super.key, required this.title, required this.image});
 final String title;
 final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 168.w,
            height: 125.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Weekly Challenge",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,),
                SizedBox(height: 8,),
                Text(title,style:GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ),
          Container(
            height: 125.h,
            width: 157.w,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image,)),
            ),
          )
        ],
      ),
    );
  }
}
