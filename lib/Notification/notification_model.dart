import 'package:intl/intl.dart';

class NotificationItem {
  final String title;
  final DateTime time;
  final String icon;
  bool isRead;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.time,
    this.isRead = false,
  });
}

class NotificationGroup {
  final String dateLabel;
  final List<NotificationItem> notifications;

  NotificationGroup({
    required this.dateLabel,
    required this.notifications,
  });
}

final List<NotificationItem> reminders = [
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bottom_bar_icons/Stars.svg',
    title: 'You Have A New Message!',
    time: DateTime.now().subtract(Duration(hours: 2)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bulb.svg',
    title: 'Scheduled Maintenance.',
    time: DateTime.now().subtract(Duration(hours: 6)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/list.svg',
    title: 'We\'ve Detected A Login From A New Device',
    time: DateTime.now().subtract(Duration(hours: 10)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/trophy.svg',
    title: 'We\'ve Updated Our Privacy Policy',
    time: DateTime.now().subtract(Duration(days: 1, hours: 2)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bulb.svg',
    title: 'You Have A New Message!',
    time: DateTime.now().subtract(Duration(days: 1, hours: 5)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bulb.svg',
    title: 'You Have A New Message!',
    time: DateTime.now().subtract(Duration(days: 5)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bulb.svg',
    title: 'We\'ve Made Changes To Our Terms Of Service',
    time: DateTime.now().subtract(Duration(days: 5, hours: 3)),
  ),
];


final List<NotificationItem> systemNotifications = [
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bottom_bar_icons/Stars.svg',
    title: 'You Have A New Message!',
    time: DateTime.now().subtract(Duration(hours: 2)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/bulb.svg',
    title: 'Scheduled Maintenance.',
    time: DateTime.now().subtract(Duration(hours: 6)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/list.svg',
    title: 'We\'ve Detected A Login From A New Device',
    time: DateTime.now().subtract(Duration(hours: 10)),
  ),
  NotificationItem(
    isRead: false,
    icon: 'assets/icons/trophy.svg',
    title: 'We\'ve Updated Our Privacy Policy',
    time: DateTime.now().subtract(Duration(days: 1, hours: 2)),
  ),
];

List<NotificationGroup> groupNotificationsByDate(List<NotificationItem> notifications) {
  Map<String, List<NotificationItem>> groupedMap = {

  };

  for (var notification in notifications) {
    String key = _getDateLabel(notification.time);
    if (!groupedMap.containsKey(key)) {
      groupedMap[key] = [];
    }
    groupedMap[key]!.add(notification);
  }

  return groupedMap.entries
      .map((entry) => NotificationGroup(dateLabel: entry.key, notifications: entry.value))
      .toList();
}
String _getDateLabel(DateTime time) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));

  if (time.isAfter(today)) {
    return 'Today';
  } else if (time.isAfter(yesterday)) {
    return 'Yesterday';
  } else {
    return DateFormat('MMM dd - yyyy').format(time);
  }
}

