import 'package:flutter/material.dart';

import '../../components/profile_components/switch_tile.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isGeneralNotificationOn = true;

  bool isSoundOn = false;

  bool isDoNotDisturbOn = false;

  bool isVibrateOn = true;

  bool isLockScreenOn = false;

  bool isRemindersOn = true;

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
          "Notifications Settings",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SwitchTile(title: 'General Notification',
                onChanged: (bool value) {
                  setState(() {
                    isGeneralNotificationOn = value;
                  });
                },
                value: isGeneralNotificationOn,
               ),
              SwitchTile(title: 'Sound',
                onChanged: (bool value) {
                  setState(() {
                    isSoundOn = value;
                  });
                },
                value: isSoundOn,
              ),
              SwitchTile(title: "Don't Disturb Mode",
                onChanged: (bool value) {
                  setState(() {
                    isDoNotDisturbOn = value;
                  });
                },
                value: isDoNotDisturbOn,
              ),
              SwitchTile(title: 'Vibrate',
                onChanged: (bool value) {
                  setState(() {
                    isVibrateOn = value;
                  });
                },
                value: isVibrateOn,
              ),
              SwitchTile(title: 'Lock Screen',
                onChanged: (bool value) {
                  setState(() {
                    isLockScreenOn = value;
                  });
                },
                value: isLockScreenOn
              ),
              SwitchTile(title: 'Reminders',
                  onChanged: (bool value) {
                    setState(() {
                      isRemindersOn = value;
                    });
                  },
                  value: isRemindersOn
              ),
            ],
          ),
        ),
      ),
    );
  }
}
