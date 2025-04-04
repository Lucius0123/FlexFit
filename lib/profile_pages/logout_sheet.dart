import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../SignUp Page/login.dart';
class LogoutSheet extends StatelessWidget {
  LogoutSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
    padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
  color: Theme.of(context).colorScheme.primary,
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20), ), ),
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text( 'Are you sure you want to log out?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black
            ) ),
        ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color:Theme.of(context).colorScheme.primary
                )),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Get.to(() =>  LoginPage());
                },
                child: Text("Yes, Logout", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
