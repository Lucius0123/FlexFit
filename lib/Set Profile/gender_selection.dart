import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({Key? key}) : super(key: key);

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Color(0xffBADE4F),size: 40,),
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
          padding:  EdgeInsets.only(bottom: 24.h),
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
              const SizedBox(height: 12),
              Container(
                height: 100.h,
                padding: EdgeInsets.all(8),
                color: Theme.of(context).colorScheme.primary,
                child:Center(
                  child: Text(
                    'Start your journey to a healthier lifestyle by setting up your profile.',
                    style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                        print(selectedGender);
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
                            color: selectedGender == 'male' ? Theme.of(context).colorScheme.onPrimary : Colors.white.withOpacity(0.20),
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: Icon(
                            Icons.male_outlined,
                            size: 100,
                            color: selectedGender == 'male' ? Theme.of(context).colorScheme.onSurface : Colors.white,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Male',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                        print(selectedGender);
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
                            color: selectedGender == 'female' ? Theme.of(context).colorScheme.onPrimary : Colors.white.withOpacity(0.20),
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: Icon(
                            Icons.female_outlined,
                            size: 100,
                            color: selectedGender == 'female' ? Theme.of(context).colorScheme.onSurface : Colors.white,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Female',
                          style:Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h,),
                    ElevatedButton(
                      onPressed:selectedGender == 'male' || selectedGender == 'female'? () => Get.toNamed('/age_selection'):null,
                      child: Text("Continue", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold
                      )),
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
