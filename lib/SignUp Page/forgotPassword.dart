import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../A part/controllers/auth_controller.dart';
import '../components/textfield.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final emailController = TextEditingController();
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
          "Forgotten Password",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 15.h), // Use .h for spacing
            Padding(
              padding: EdgeInsets.all(12.w), // Use .w for padding
              child: Text(
                "Enter your email to receive a password reset link.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child: GeneralTextField(
                feildColor: Colors.black,
                filledName: 'Enter your email address',
                controller: emailController,
                hintText: "abc12@gmail.com",
                type: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 20),
            Obx(()=>ElevatedButton(
              onPressed: authController.isLoading.value
                  ? null
                  : () {
                if (emailController.text.isEmpty) {
                  Get.snackbar('Error', 'Please enter your email');
                  return;
                }

                authController.resetPassword(emailController.text.trim());
              },
              child: authController.isLoading.value
                  ?const CircularProgressIndicator(color: Colors.white)
                  :Text('Send Reset Link', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
              )),
            )),
          ],
        ),
      ),
    );
  }
}
