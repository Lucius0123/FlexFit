import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key,
    required this.title,
    required this.time,
    required this.energy,
    required this.exercises,
    required this.image});
  final String title;
  final String time;
  final String energy;
  final String exercises;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 168.w,
            height: 125.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),),
                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time_filled_outlined,color:Theme.of(context).colorScheme.primary,size: 15,),
                          const SizedBox(width: 5,),
                          Text(time, style:Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          ),),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/Calories.svg', // Replace with your SVG file path
                            width: 15,
                            height: 15,
                            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 5,),
                          Text(energy,style:Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 11.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/icons/run.svg', // Replace with your SVG file path
                          width: 15,
                          height: 15,
                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 5,),
                        Text(exercises,style:Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 11.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                        ),),
                      ],),


                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 125.h,
            width: 145.w,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image,)),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){},
                icon: const Icon(Icons.star,size: 30,),),
            ),
          )
        ],
      ),
    );
  }
}
