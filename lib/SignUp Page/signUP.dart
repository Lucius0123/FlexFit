import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../A part/controllers/auth_controller.dart';
import '../components/textfield.dart';
import 'login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        "Create Account",
        style: Theme.of(context).textTheme.displayMedium,
      ),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white
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
                      hintText: "Abce",
                      filledName: 'Full Name',
                      controller: nameController),
                  const SizedBox(height: 20,),
                  GeneralTextField(
                      feildColor: Colors.black,
                      hintText: "aabc@gmail.com",
                      filledName: 'Email',
                      controller: emailController),
                  const SizedBox(height: 20,),
                  PasswordTextField(
                      feildColor: Colors.black,
                      text: 'Password',
                      controller:passwordController,
                      passFilledName: "Password"),
                  const SizedBox(height: 20,),
                  PasswordTextField(
                      feildColor: Colors.black,
                      text: 'Confirm Password',
                      controller: confirmPasswordController,
                      passFilledName: "Confirm Password")
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('By continuing, you agree to'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                    onPressed: (){},
                      child: Text(
                        "Terms of Use",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                    ),
                    const Text('and'),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        " Privacy Policy",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
             SizedBox(height: 16.h,),
            Obx(() => ElevatedButton(
              onPressed: authController.isLoading.value
                  ? null
                  : () {
                // Validate inputs
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  Get.snackbar('Error', 'Please fill in all fields');
                  return;
                }

                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar('Error', 'Passwords do not match');
                  return;
                }

                if (passwordController.text.length < 6) {
                  Get.snackbar('Error', 'Password must be at least 6 characters');
                  return;
                }

                authController.signUp(
                  nameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: authController.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  :  Text("Sign Up", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
              )),
            )),
            SizedBox(height: 16.h),
            Center(
              child: Text("or sign up with", style: Theme.of(context).textTheme.bodyMedium),
            ),

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
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() =>  LoginPage());
                    },
                    child: Text(
                      "Log In",
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
