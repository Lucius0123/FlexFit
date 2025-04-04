import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../components/textfield.dart';

class PasswordSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon:  Icon(
            Icons.navigate_before,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Password Settings",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PasswordTextField(
                feildColor: Theme.of(context).colorScheme.primary,
                  text: "Current Password",
                  controller: pass,
                  passFilledName: "Current Password"),
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
              SizedBox(height: 16),
              PasswordTextField(
                  feildColor: Theme.of(context).colorScheme.primary,
                  text: "New Password",
                  controller: pass,
                  passFilledName: "New Password"),
              SizedBox(height: 16),
              PasswordTextField(
                  feildColor: Theme.of(context).colorScheme.primary,
                  text: "Confirm New Password",
                  controller: pass,
                  passFilledName: "Confirm New Password"),
              SizedBox(height: 36.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary
                ),
                onPressed: () {
                },
                child: Text("Change Password", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
