import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/textfield.dart';

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController conpass = TextEditingController();
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
        padding:  EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "Fill Your Profile",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 65.w,
                    ),
                    IconButton(
                      onPressed: () {  },
                      icon: SvgPicture.asset(
                        'assets/icons/edit.svg', // Replace with your SVG file path
                        width: 30.w,
                        height: 30.w,
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              child: Column(
                children: [
                  GeneralTextField(
                      feildColor: Theme.of(context).colorScheme.primary,
                      hintText: "Abce Abe",
                      filledName: 'Full Name',
                      controller: conpass),
                  const SizedBox(height: 20,),
                  GeneralTextField(
                      feildColor: Theme.of(context).colorScheme.primary,
                      hintText: "Maddy",
                      filledName: 'NickName',
                      controller: conpass),
                  const SizedBox(height: 20,),
                  GeneralTextField(
                      feildColor: Theme.of(context).colorScheme.primary,
                      hintText: "madisons@example.com",
                      filledName: 'Email',
                      controller: conpass),
                  const SizedBox(height: 20,),
                  GeneralTextField(
                      feildColor: Theme.of(context).colorScheme.primary,
                      hintText: "+91 63295357",
                      filledName: 'Phone Number',
                      controller: conpass),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onPrimary
              ),
                onPressed: () => Get.toNamed('/home_page'),
              child: Text("Start", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                color: Colors.black
              )),
            ),
          ],
        ),
      ),
    );
  }
}
