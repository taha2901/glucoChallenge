import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/networking/api_keys.dart';
import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/diabets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().initializeNotifications();

  setUpGetIt();
  await NotificationService().requestPermissions();

  Future<void> loadUserData() async {
    String? photoUrl = await SharedPrefHelper.getString('photoUrl');
    String? name = await SharedPrefHelper.getString('name');
    String? password = await SharedPrefHelper.getString('password');

    // يمكنك الآن استخدام هذه القيم كما تريد
    print("User photo URL: $photoUrl");
    print("User name: $name");
    print("User password: $password");
  }

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
