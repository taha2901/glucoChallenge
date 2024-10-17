// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();

//   factory NotificationService() {
//     return _instance;
//   }

//   NotificationService._internal() {
//     _initializeNotifications();
//   }

//   void _initializeNotifications() {
//     AwesomeNotifications().initialize(
//       'resource://mipmap/jbtronic',
//       [
//         NotificationChannel(
//           channelKey: 'scheduled_channel',
//           channelName: 'Scheduled Notifications',
//           channelDescription: 'Notifications sent on a schedule',
//           defaultColor: const Color(0xFF9D50DD),
//           ledColor: Colors.white,
//           importance: NotificationImportance.High,
//           locked: true,
//         ),
//       ],
//       debug: true,
//     );
//   }

//   Future<void> requestPermissions() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       await AwesomeNotifications().requestPermissionToSendNotifications();
//     }
//   }

//   Future<void> scheduleRepeatingNotification({required String body}) async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 10,
//         // Unique ID for each notification
//         channelKey: 'scheduled_channel',
//         title: 'وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ',
//         body: body,
//         notificationLayout: NotificationLayout.Default,
//         displayOnBackground: true,
//         displayOnForeground: true,
//       ),
//       schedule: NotificationInterval(
//         interval: 15 * 60, // 15 minutes in seconds
//         timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
//         repeats: true,
//       ),
//     );
//   }

//   Future<void> sendNotification() async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 0,
//         // Ensure this ID is unique if used for multiple notifications
//         channelKey: 'scheduled_channel',
//         title: 'Hello',
//         body: 'This is a simple notification',
//         notificationLayout: NotificationLayout.Default,
//       ),
//     );
//   }

//   Future<void> cancelAllNotifications() async {
//     await AwesomeNotifications().cancelAll();
//   }
// }

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    AwesomeNotifications().initialize(
      'resource://mipmap/jbtronic',
      [
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          channelDescription: 'Notifications sent on a schedule',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          locked: true,
        ),
      ],
      debug: true,
    );
  }

  Future<void> requestPermissions() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      print('طلب صلاحيات الإشعارات');
      await AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      print('صلاحيات الإشعارات متاحة');
    }
  }

  // Method to schedule notifications based on the user's time preference
    Future<void> scheduleNotification({
    required String body,
    required String timePreference,
  }) async {
    DateTime now = DateTime.now();
    DateTime scheduledTime;

    // Determine the time for the notification based on the preference
    if (timePreference == 'صباحًا') {
      scheduledTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    } else if (timePreference == 'مساءً') {
      scheduledTime = DateTime(now.year, now.month, now.day, 20, 0, 0);
    } else if (timePreference == 'بعد الظهر') {
      scheduledTime = DateTime(now.year, now.month, now.day, 13, 0, 0);
    } else {
      return;
    }


    // If the time has passed for today, schedule it for the next day
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: 'تذكير بالدواء',
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        year: scheduledTime.year,
        month: scheduledTime.month,
        day: scheduledTime.day,
        hour: scheduledTime.hour,
        minute: scheduledTime.minute,
        second: 0,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        repeats: true, // لضمان تكرار الإشعار يومياً
      ),
    );
  }


  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  // Generate a unique ID for notifications
  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }
}
