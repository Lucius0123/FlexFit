import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/Set%20Profile/ruler_picker.dart';
import '../A part/controllers/onboarding_controller.dart';
import 'goal_select.dart';


class HeightSelectionPage extends StatelessWidget {
  const HeightSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Color(0xffBADE4F), size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Back",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 24.h),
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "Select your height.",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                'Start your journey to a healthier lifestyle by setting up your profile.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50.h),
            CustomScalePicker(
              minValue: 145,
              maxValue: 220,
              initialValue: controller.height.value.toInt(),
              isVertical: false,
              unit: "Cm",
              onChanged: (value) {
                controller.setHeight(value.toDouble());
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const GoalSelectionPage());
              },
              child: Text(
                  "Continue",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

