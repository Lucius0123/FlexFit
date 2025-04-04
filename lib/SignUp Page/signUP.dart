import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController conpass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.navigate_before, color: Color(0xffBADE4F),size: 40,),
        onPressed: () {},
      ),
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
            const SizedBox(height: 50),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white
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
                      hintText: "Abce Abe",
                      filledName: 'Full Name',
                      controller: fullName),
                  const SizedBox(height: 20,),
                  GeneralTextField(
                      feildColor: Colors.black,
                      hintText: "+91 63295357",
                      filledName: 'Email or Phone Number',
                      controller: email),
                  const SizedBox(height: 20,),
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
              ),
            ),
            SizedBox(height: 26.h),
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
             SizedBox(height: 26.h,),
            ElevatedButton(
              onPressed: () => Get.toNamed('/setUp'),
              child: Text("Sign Up", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold
              )),
            ),
            SizedBox(height: 26.h),
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
                    onPressed: () => Get.toNamed('/login'),
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
