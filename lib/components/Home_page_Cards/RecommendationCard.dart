import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard( {super.key,required this.calories, required this.title, required this.time, required this.image});
  final String calories;
  final String title;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      height: 150.h,
      width: 175.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child:Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 175.h,
                  height: 92.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)
                      )
                  ),
                  child: Image.asset(image,fit: BoxFit.fill,)
              ),Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)
                  ),
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 2), // Top border
                    left: BorderSide(color: Colors.white, width: 2), // Left border
                    right: BorderSide(color: Colors.white, width: 2), // Right border
                    // No bottom border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(title, style:GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(Icons.access_time_filled_outlined,color:Theme.of(context).colorScheme.primary,size: 15,),
                            const SizedBox(width: 5,),
                            Text(time, style:GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                            ),),
                            Spacer(),
                            SvgPicture.asset(
                              'assets/icons/Calories.svg', // Replace with your SVG file path
                              width: 15,
                              height: 15,
                              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 5,),
                            Text(calories, style:GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                            ),),
                    ],
                  ),
                                ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
               IconButton(onPressed: (){},
                   icon: Icon(Icons.star,color: Colors.white,size: 30,)),
                SizedBox(height: 30.h,),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: IconButton(onPressed: (){},
                      icon: SvgPicture.asset(
                        'assets/icons/play.svg', // Replace with your SVG file path
                        width: 30,
                        height: 30,
                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),),
                )
              ],
            ),
          )
        ],

      )
    );
  }
}
