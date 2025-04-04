import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Color(0xffBADE4F),size: 40,),
          onPressed: () {},
        ),
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
            const SizedBox(height: 50,),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white
              ),
            ),
            SizedBox(height: 26.h), // Use .h for spacing
            Padding(
              padding: EdgeInsets.all(12.w), // Use .w for padding
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur  nnkjjbvb kfkrusdb  bfjwherbfj jrke wek wrbfrbewb kbkrbk adipiscing elit.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 26.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child: Column(
                children: [
                  GeneralTextField(
                    feildColor: Colors.black,
                    filledName: 'Username or email',
                      controller: name,
                    hintText: "Abc sbn",
                    ),
                  SizedBox(height: 10.h),
                  PasswordTextField(
                      text: "Password",
                      controller: pass, passFilledName: "Password",)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed('/forgot_password'),
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () => Get.toNamed('/home_page'),
              child: Text("Log In", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold
              )),
            ),
            SizedBox(height: 26.h),
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
                    onPressed: () => Get.toNamed('/signup'),
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
