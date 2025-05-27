import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../A part/controllers/onboarding_controller.dart';


class ActivityLevelPage extends StatefulWidget {
  const ActivityLevelPage({Key? key}) : super(key: key);

  @override
  State<ActivityLevelPage> createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  final OnboardingController controller = Get.find<OnboardingController>();
  int? _selectedIndex;

  final List<String> activityLevels = ["Beginner", "Intermediate", "Advanced"];

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
      body: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "Physical Activity Level",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                itemCount: activityLevels.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        controller.setActivityLevel(activityLevels[index]);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(38),
                      ),
                      child: Text(
                        activityLevels[index],
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: _selectedIndex == index
                                ? Colors.black
                                : Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary
              ),
              onPressed:_selectedIndex != null? () {
                // Complete onboarding
                controller.completeOnboarding();
              }:null,
              child: Text(
                  "Start",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

