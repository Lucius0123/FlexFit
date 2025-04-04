import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pose_detection_realtime/profile_pages/Setting_Page/password_setting.dart';

import '../../components/profile_components/status_card.dart';
import 'notification_setting.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          "Settings",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Column(
        children: [
          StatusCard(
             onTap: (){
               Get.to(() => NotificationSettingsPage());
             },
              title:'Notification Setting',
              icon: 'assets/icons/bell.svg'),
          StatusCard(
            onTap: (){
              Get.to(() => PasswordSettingsPage());
            },
              title: 'Password Setting',
              icon: 'assets/icons/key.svg'),
          StatusCard(
            onTap: (){},
              title: 'Delete Account',
              icon:'assets/icons/profile_icons/person.svg'),
        ],
      )
    );
  }
}
