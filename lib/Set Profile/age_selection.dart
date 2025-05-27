import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/Set%20Profile/ruler_picker.dart';
import 'package:pose_detection_realtime/Set%20Profile/select_weight.dart';
import '../A part/controllers/onboarding_controller.dart';


class AgeSelectionPage extends StatelessWidget {
  const AgeSelectionPage({Key? key}) : super(key: key);

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
                "Please select your age using the scale below.",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'Start your journey to a healthier lifestyle by setting up your profile.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 35.h),
            CustomScalePicker(
              minValue: 0,
              maxValue: 90,
              initialValue: controller.age.value,
              isVertical: false,
              unit: "Years",
              onChanged: (value) {
                controller.setAge(value);
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const WeightSelectionPage());
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

