import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/Set%20Profile/set_Activity_level.dart';

import '../A part/controllers/onboarding_controller.dart';

class GoalSelectionPage extends StatefulWidget {
  const GoalSelectionPage({Key? key}) : super(key: key);

  @override
  State<GoalSelectionPage> createState() => _GoalSelectionPageState();
}

class _GoalSelectionPageState extends State<GoalSelectionPage> {
  final OnboardingController controller = Get.find<OnboardingController>();
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final List<String> goals = [
      'Lose Weight',
      'Gain Weight',
      'Muscle Mass Gain',
      'Shape Body',
      'Others',
    ];

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
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "What Is Your Goal?",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.only(left: 24, right: 8),
                child: Scrollbar(
                  trackVisibility: true,
                  thickness: 8.0,
                  radius: const Radius.circular(10),
                  interactive: true,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 22),
                          padding: EdgeInsets.only(left: 24, right: 8),
                          height: 70,
                          width: 200.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(36)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                goals[index],
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black
                                ),
                              ),
                              Transform.scale(
                                scale: 2,
                                child: Radio<int>(
                                  value: index,
                                  fillColor: MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                      if (_selectedIndex == index) {
                                        return Theme.of(context).colorScheme.onPrimary;
                                      } else {
                                        return Colors.black;
                                      }
                                    },
                                  ),
                                  groupValue: _selectedIndex,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedIndex = value;
                                      if (value != null) {
                                        controller.setGoal(goals[value]);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: _selectedIndex != null
                  ? () {
                Get.to(() =>  ActivityLevelPage());
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
      ),
    );
  }
}

