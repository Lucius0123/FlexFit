import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../A part/controllers/auth_controller.dart';
import '../A part/controllers/user_controller.dart';
import '../components/profile_components/details_card.dart';
import '../components/textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userController = Get.find<UserController>();
  final authController = Get.find<AuthController>();
  late TextEditingController name;
  late TextEditingController age;
  late TextEditingController weight;
  late TextEditingController height;
  late TextEditingController goalController;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    final user = userController.currentUser.value;
    name = TextEditingController(text: user?.name ?? '');
    age = TextEditingController(text: user?.age?.toString() ?? '');
    weight = TextEditingController(text: user?.weight?.toString() ?? '');
    height = TextEditingController(text: user?.height?.toString() ?? '');
    goalController = TextEditingController(text: user?.goal ?? '');

    // Handle profile image
    if (user?.profilePicUrl != null && user!.profilePicUrl.startsWith('/')) {
      _profileImage = File(user.profilePicUrl);
    }
  }

  @override
  void dispose() {
    name.dispose();
    age.dispose();
    weight.dispose();
    height.dispose();
    goalController.dispose();
    super.dispose();
  }

  final List<String> goals = [
    'Lose Weight',
    'Gain Weight',
    'Shape Body',
    'Other',
  ];

  void _showGoalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Select Your Goal',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: goals.map((goal) {
              return ListTile(
                title: Text(goal),
                onTap: () {
                  goalController.text = goal;
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
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
      body: Obx((){
        final user = userController.currentUser.value;

        if (user == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.h),
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
                                  Hero(
                                    tag: 'profileImage',
                                    child: CircleAvatar(
                                      radius: 65.h,
                                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                      backgroundImage: _profileImage != null
                                          ? FileImage(_profileImage!)
                                          : user.profilePicUrl.startsWith('http')
                                          ? NetworkImage(user.profilePicUrl) as ImageProvider
                                          : AssetImage(user.profilePicUrl),
                                      // Force image refresh by using a key based on the image URL
                                      key: ValueKey(_profileImage != null ? _profileImage.hashCode : user.profilePicUrl),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      final picker = ImagePicker();
                                      final pickedFile = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 80, // Reduce image quality to improve upload speed
                                      );

                                      if (pickedFile != null) {
                                        setState(() {
                                          _profileImage = File(pickedFile.path);
                                        });
                                      }
                                    },
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24.h),
                          child: Column(
                            children: [
                              GeneralTextField(
                                  feildColor: Theme.of(context).colorScheme.primary,
                                  hintText: 'Madison Smith',
                                  filledName: 'Full Name',
                                  controller: name),
                              SizedBox(height: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Goal',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),),
                                  const SizedBox(height: 8,),
                                  TextField(
                                    onTap: _showGoalDialog,
                                    controller: goalController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: 'Lose weight',
                                        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                                            color: Colors.grey
                                        )
                                    ),
                                    style:Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16,),
                              GeneralTextField(
                                  feildColor: Theme.of(context).colorScheme.primary,
                                  hintText: '22 Years',
                                  filledName: 'Age',
                                  controller: age),
                              SizedBox(height: 16,),
                              GeneralTextField(
                                  feildColor: Theme.of(context).colorScheme.primary,
                                  hintText: '73 Kg',
                                  filledName: 'Weight',
                                  controller: weight),
                              SizedBox(height: 16,),
                              GeneralTextField(
                                  feildColor: Theme.of(context).colorScheme.primary,
                                  hintText: '157 Cm',
                                  filledName: 'Height',
                                  controller: height),
                            ],
                          ),
                        ),
                        Obx(()=>ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.onPrimary
                          ),
                          onPressed: authController.isLoading.value
                              ? null
                              : () {
                            // Validate inputs before updating
                            if (name.text.isEmpty) {
                              Get.snackbar('Error', 'Name cannot be empty');
                              return;
                            }

                            // Ensure we have valid numeric values
                            double? heightValue = double.tryParse(height.text);
                            double? weightValue = double.tryParse(weight.text);
                            int? ageValue = int.tryParse(age.text);

                            if (heightValue == null && height.text.isNotEmpty) {
                              Get.snackbar('Error', 'Height must be a valid number');
                              return;
                            }

                            if (weightValue == null && weight.text.isNotEmpty) {
                              Get.snackbar('Error', 'Weight must be a valid number');
                              return;
                            }

                            if (ageValue == null && age.text.isNotEmpty) {
                              Get.snackbar('Error', 'Age must be a valid number');
                              return;
                            }

                            authController.updateProfile(
                              name: name.text,
                              profileImage: _profileImage,
                              height: height.text,
                              weight: weight.text,
                              goal: goalController.text,
                              age: age.text,
                              level: user.level, // Preserve existing level
                            );
                          },
                          child: Text("Update Profile", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )),
                        ),
                        )
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
                                value: user.weight != null ? '${user.weight!.toStringAsFixed(1)} Kg' : 'Not set',
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
                                value: user.height != null ? '${user.height!.toStringAsFixed(1)} CM' : 'Not set',
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
          ),
        );
      }),

    );
  }
}
