import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components/profile_components/details_card.dart';
import '../components/profile_components/status_card.dart';
import 'Edit_profile.dart';
import 'Help&FAQ/help&faq.dart';
import 'Setting_Page/setting_page.dart';
import 'logout_sheet.dart';


class MyProfilePage extends StatelessWidget {
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
          'My Profile',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
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
                      padding:  EdgeInsets.symmetric(vertical: 12.h),
                      child: Column(
                        children: [
                          // Profile Image
                           CircleAvatar(
                            radius: 65.h,
                            backgroundColor: Colors.amber,
                            // Replace with your image
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
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            StatusCard(
                              icon: 'assets/icons/profile_icons/person.svg',
                                title: 'Profile' ,
                                onTap: (){
                                  Get.to(() => EditProfile());
                                },
                                ),
                            StatusCard(
                              onTap: (){},
                                title:'Privacy Policy' ,
                                icon: 'assets/icons/profile_icons/privacy.svg'),
                            StatusCard(
                              icon:  'assets/icons/profile_icons/setting.svg',
                                title: 'Settings',
                                onTap: (){
                                  Get.to(() => SettingsPage());
                                },
        
                               ),
                            StatusCard(
                              title: 'Help',
                                onTap: (){
                                  Get.to(() => HelpFAQPage());
                                },
                                icon:'assets/icons/bottom_bar_icons/Support & Help Switch.svg'),
                            StatusCard(
                              title:'Logout',
                                onTap: (){
                                  showModalBottomSheet(context: context, builder:(BuildContext context){
                                    return LogoutSheet ();
                                  });
                                },
                                icon:'assets/icons/profile_icons/logout.svg'),
                          ],
                        ),
                      ),
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
    );
  }
}
