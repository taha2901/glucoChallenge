import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/diabets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //   'resource://mipmap/ic_launcher',
  //   [
  //     NotificationChannel(
  //       channelKey: 'scheduled',
  //       channelName: 'Scheduled Notifications',
  //       channelDescription: 'Channel for scheduled notifications',
  //       defaultColor: const Color(0xFF9D50BB),
  //       ledColor: Colors.white,
  //     )
  //   ],
  // );
    NotificationService().initializeNotifications();


  setUpGetIt();
  await NotificationService().requestPermissions();

  SharedPrefHelper.getString(
    
      ' SharedPrefHelper for my name is  ${SharedPrefKeys.myName}');

  SharedPrefHelper.getString(
      ' SharedPrefHelper for my pic is  ${SharedPrefKeys.userPhotoUrl}');

  await ScreenUtil.ensureScreenSize();
  await checkLoggedInUser();

  runApp(
    Diabetes(
      appRouter: AppRouter(),
    ),
  );
}

checkLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
