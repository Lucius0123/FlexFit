import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'notification_model.dart';

class NotificationsPage extends StatefulWidget {

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  int _selectedTab = 0;
  Widget build(BuildContext context) {
    final notifications =
    _selectedTab == 0 ? reminders : systemNotifications;
    final groupedNotifications = groupNotificationsByDate(notifications);
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
          'Notifications',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),

      body: Column(
        children: [
          _buildTabButtons(),
          Expanded(
            child: ListView.builder(
              itemCount: groupedNotifications.length,
              itemBuilder: (context, index) {
                final group = groupedNotifications[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        group.dateLabel,
                        style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ...group.notifications.map((notification) {
                      return Container(margin: const EdgeInsets.symmetric(vertical: 12),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0), // Circular border
                          ),
                          leading: Stack(
                            children: [
                              CircleAvatar(
                                radius: 22.w,
                                child: SvgPicture.asset(
                                  notification.icon, // Replace with your SVG file path
                                  width: 30,
                                  height: 30,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),),
                              if (!notification.isRead)
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                            ],
                          ),
                          title: Text(notification.title,style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),),
                          subtitle: Text(DateFormat('MMM dd - h:mm a').format(notification.time),style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500
                          ),),
                          onTap: () {
                            setState(() {
                              notification.isRead = true;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTabButtons() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton("Reminders", 0),
          const SizedBox(width: 16),
          _buildTabButton("System", 1),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int tabIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabIndex;
        });
      },
      child: Container(
        height: 40.w,
        width: 150.w,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: _selectedTab == tabIndex
              ? Theme.of(context).colorScheme.onPrimary
              : Colors.white,
          borderRadius: BorderRadius.circular(38),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: _selectedTab == tabIndex
                  ? Colors.black
                  : Theme.of(context).colorScheme.primary,
            )
          ),
        ),
      ),
    );
  }
}

