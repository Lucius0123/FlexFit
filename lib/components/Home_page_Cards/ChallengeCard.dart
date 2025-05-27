import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../A part/controllers/daily_challenge_controller.dart';
import '../../A part/models/daily_challenge.dart';
import '../../A part/screens/daily_challenge_screen.dart';

class ChallengeCard extends StatelessWidget {
   ChallengeCard({super.key,});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DailyChallengeController>();

    return Obx(() {
      final challenge = controller.todayChallenge.value;

      if (challenge == null) {
        return const SizedBox.shrink();
      }

      final isCompleted = challenge.status == ChallengeStatus.completed;

      return GestureDetector(
        onTap: () {
          Get.to(() => const DailyChallengeScreen());
        },
        child: Container(
          height: 125.h,
          width: 325.w,
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .surface,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .displayMedium,),
                    SizedBox(height: 8,),
                    Text(challenge.title, style: GoogleFonts.poppins(
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
                decoration: BoxDecoration(color: Theme
                    .of(context)
                    .colorScheme
                    .surface,
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
