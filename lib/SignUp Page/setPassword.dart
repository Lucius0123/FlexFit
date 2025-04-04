import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/textfield.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();
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
          "set Password",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // Use .h for spacing
            Padding(
              padding: EdgeInsets.all(12.w), // Use .w for padding
              child: Text(
                "Enter a password to secure your Account.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child:Column(
                children: [
                  PasswordTextField(
                      text: 'Password',
                      controller: pass,
                      passFilledName: "Password"),
                  const SizedBox(height: 20,),
                  PasswordTextField(
                      text: 'Confirm Password',
                      controller: pass,
                      passFilledName: "Confirm Password")
                ],
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/set_password'),
              child: Text("Reset Password", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
              )),
            ),
          ],
        ),
      ),
    );
  }
}
