import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/diabets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    Diabetes(
      appRouter: AppRouter(),
    ),
  );
}
