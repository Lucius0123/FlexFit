import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/home_page.dart';
import '../A part/controllers/app_controller.dart';
import '../A part/controllers/auth_controller.dart';
import '../A part/controllers/user_controller.dart';
import '../components/profile_components/details_card.dart';
import '../components/profile_components/status_card.dart';
import 'Edit_profile.dart';
import 'Help&FAQ/help&faq.dart';
import 'Setting_Page/setting_page.dart';
import 'logout_sheet.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final appController = Get.find<AppController>();
  final userController = Get.find<UserController>();
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    // Refresh user data when page is opened
    _refreshUserData();
  }

  // Force refresh of user data when page is opened
  void _refreshUserData() async {
    if (authController.firebaseUser.value != null) {
      await authController.fetchUserData(authController.firebaseUser.value!.uid);
    }
  }

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
            Get.offAll(() => HomeScreen());
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
      body: Obx((){
        final user = userController.currentUser.value;
        if (user == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
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
                        width: double.infinity,
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Purple background
                        padding:  EdgeInsets.symmetric(vertical: 12.h),
                        child: Column(
                          children: [
                            // Profile Image
                            Hero(
                              tag: 'profileImage',
                              child: CircleAvatar(
                                radius: 65.h,
                                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                backgroundImage: user.profilePicUrl.startsWith('http')
                                    ? NetworkImage(user.profilePicUrl) as ImageProvider
                                    : AssetImage(user.profilePicUrl),
                                // Force image refresh by using a key based on the image URL
                                key: ValueKey(user.profilePicUrl),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Name and Email
                            Text(
                              user.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ID:',
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
                                  '${user.uniqueId}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Level:',
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
                                  user.level,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Goal:',
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
                                  user.goal ?? "Not set",
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
                                title: 'Edit Profile' ,
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
                                      return LogoutSheet();
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
                          DetailsCard(
                              value: user.weight != null ? user.weight!.toStringAsFixed(1) : 'Not set',
                              label: 'Weight'
                          ),
                          Container(
                            width: 2,
                            height: 50.h,
                            color: Colors.white,
                          ),
                          DetailsCard(
                              value: user.age != null ? '${user.age}' : 'Not set',
                              label: 'Years Old'
                          ),
                          Container(
                            width: 2,
                            height: 50.h,
                            color: Colors.white,
                          ),
                          DetailsCard(
                              value: user.height != null ? user.height!.toStringAsFixed(1) : 'Not set',
                              label: 'Height'
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
