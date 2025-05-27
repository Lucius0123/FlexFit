import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/SignUp%20Page/signUP.dart';

import '../A part/controllers/auth_controller.dart';
import '../A part/screens/forgot_password_screen.dart';
import '../components/textfield.dart';
import 'forgotPassword.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  @override
  final authController = Get.find<AuthController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Log In",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white
              ),
            ),
            SizedBox(height: 16.h), // Use .h for spacing
            Padding(
              padding: EdgeInsets.all(12.w), // Use .w for padding
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur  nnkjjbvb kfkrusdb  bfjwherbfj jrke wek wrbfrbewb kbkrbk adipiscing elit.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child: Column(
                children: [
                  GeneralTextField(
                    feildColor: Colors.black,
                    filledName: 'Username or email',
                      controller: emailController,
                    hintText: "Abc sbn",
                    ),
                  SizedBox(height: 10.h),
                  PasswordTextField(
                      text: "Password",
                      controller: passwordController,
                    feildColor: Colors.black,
                    passFilledName: "Password",)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() =>  ForgotPasswordPage());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(() => ElevatedButton(
              onPressed: authController.isLoading.value
                  ? null
                  : () {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  Get.snackbar('Error', 'Please fill in all fields');
                  return;
                }
                authController.signIn(
                  emailController.text.trim(),
                  passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: authController.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  :  Text(
                'Log In',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold
                  )
              ),
            )),
            SizedBox(height: 16.h),
            Center(
              child: Text("or sign up with", style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.g_mobiledata_rounded,color:Theme.of(context).colorScheme.primary,size: 50,), onPressed: () {}),
                IconButton(icon: Icon(Icons.facebook, color:Theme.of(context).colorScheme.primary,size: 50,), onPressed: () {}),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpPage());
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
