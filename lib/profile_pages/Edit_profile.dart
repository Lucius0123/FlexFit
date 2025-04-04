import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/profile_components/details_card.dart';
import '../components/textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController passtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Purple Header with Profile Image
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300.h,
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Purple background
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            // Profile Image
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 65.h,
                                  backgroundColor: Colors.amber,
                                ),
                                IconButton(
                                  onPressed: () {  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/edit.svg', // Replace with your SVG file path
                                    width: 30.h,
                                    height: 30.h,
                                  ),),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Name and Email
                            Text(
                              'Madison Smith',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'madison@example.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Birthday:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'April 1st',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Stats (Weight, Age, Height)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 24.h),
                        child: Column(
                          children: [
                            GeneralTextField(
                              feildColor: Theme.of(context).colorScheme.primary,
                                hintText: 'Madison Smith',
                                filledName: 'Full Name',
                                controller: passtext),
                            SizedBox(height: 16,),
                            GeneralTextField(
                                feildColor: Theme.of(context).colorScheme.primary,
                                hintText: 'Email@gail.com',
                                filledName: 'Email Address',
                                controller: passtext),
                            SizedBox(height: 16,),
                            GeneralTextField(
                                feildColor: Theme.of(context).colorScheme.primary,
                                hintText: '98638448',
                                filledName: 'Mobile No.',
                                controller: passtext),
                            SizedBox(height: 16,),
                            GeneralTextField(
                                feildColor: Theme.of(context).colorScheme.primary,
                                hintText: '07/07/1998',
                                filledName: 'Date of Birth',
                                controller: passtext),
                            SizedBox(height: 16,),
                            GeneralTextField(
                                feildColor: Theme.of(context).colorScheme.primary,
                                hintText: '73 Kg',
                                filledName: 'Weight',
                                controller: passtext),
                            SizedBox(height: 16,),
                            GeneralTextField(
                                feildColor: Theme.of(context).colorScheme.primary,
                                hintText: '157 Cm',
                                filledName: 'Height',
                                controller: passtext),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.onPrimary
                        ),
                        onPressed: () {
                        },
                        child: Text("Update Profile", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 265.h,
                    left: 20.w,
                    right: 20.w,
                    child: Container(
                      width: 325.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const DetailsCard(value: '75 Kg', label: 'Weight'),
                          Container(
                            width: 2,
                            height: 50.h,
                            color: Colors.white,
                          ),
                          const DetailsCard(value: '28', label: 'Years Old'),
                          Container(
                            width: 2,
                            height: 50.h,
                            color: Colors.white,
                          ),
                          const DetailsCard(value: '1.65 CM', label: 'Height'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
