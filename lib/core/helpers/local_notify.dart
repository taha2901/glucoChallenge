import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationService {
  Future<void> requestPermissions() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> initializeNotifications() async {
    AwesomeNotifications().initialize(
      'resource://mipmap/ic_launch',
      [
        NotificationChannel(
          channelKey: 'scheduled',
          channelName: 'Scheduled Notifications',
          channelDescription:
              'Notification channel for scheduled notifications',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        ),
      ],
    );
  }

  Future<void> scheduleNotification(
      {required String body, required String time}) async {
    try {
      // تنظيف المدخلات
      String cleanedTime = time.trim();
      String formattedTime =
          cleanedTime.replaceAll('م', 'PM').replaceAll('ص', 'AM');

      // الحصول على التاريخ الحالي
      DateTime now = DateTime.now();
      DateTime scheduledDateTime = DateFormat('h:mm a').parse(formattedTime);

      // دمج الوقت مع التاريخ الحالي
      DateTime finalScheduledDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        scheduledDateTime.hour,
        scheduledDateTime.minute,
      );

      // التأكد من أن التاريخ المجدول في المستقبل
      if (finalScheduledDateTime.isBefore(now)) {
        // إذا كان التاريخ المجدول في الماضي، أضف يومًا
        finalScheduledDateTime = finalScheduledDateTime.add(Duration(days: 1));
      }

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'scheduled',
          title: 'تذكير بتناول الدواء',
          body: body,
          notificationLayout: NotificationLayout.Default,
          displayOnBackground: true,
          displayOnForeground: true,
        ),
        schedule: NotificationCalendar.fromDate(
          date: finalScheduledDateTime,
          repeats: true,
        ),
      );

      print('Notification Scheduled for: $cleanedTime');
    } catch (e) {
      print('Error scheduling notification: $e');
    }
  }
}
