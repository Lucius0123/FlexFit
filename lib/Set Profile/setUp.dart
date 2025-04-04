import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'gender_selection.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(bottom: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/workout-gym.png', height: 350.h,width:double.infinity,fit: BoxFit.cover,),
              const SizedBox(height: 20),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                 child: Text(
                  'Consistency Is The Key To Progress. Don’t Give Up!',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                           ),
               ),
              const SizedBox(height: 12),
              Container(
                height: 116.h,
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
              SizedBox(height: 26.h,),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const GenderSelectionPage());
                },
                child: Text("Next", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
