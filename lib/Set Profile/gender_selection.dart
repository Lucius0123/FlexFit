import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../A part/controllers/onboarding_controller.dart';
import 'age_selection.dart';


class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({Key? key}) : super(key: key);

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  final OnboardingController controller = Get.find<OnboardingController>();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Text(
                  'Select your gender to personalize your fitness plan.',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 100.h,
                padding: EdgeInsets.all(8),
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    'Start your journey to a healthier lifestyle by setting up your profile.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
               SizedBox(height: 16.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedGender == 'male'
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.white.withOpacity(0.20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.male_outlined,
                            size: 100,
                            color: selectedGender == 'male'
                                ? Theme.of(context).colorScheme.onSurface
                                : Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Male',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedGender == 'female'
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.white.withOpacity(0.20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.female_outlined,
                            size: 100,
                            color: selectedGender == 'female'
                                ? Theme.of(context).colorScheme.onSurface
                                : Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Female',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: selectedGender == 'male' || selectedGender == 'female'
                        ? () {
                      // Save gender to controller
                      controller.setGender(selectedGender!);
                      Get.to(() => const AgeSelectionPage());
                    }
                        : null,
                    child: Text(
                        "Continue",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

