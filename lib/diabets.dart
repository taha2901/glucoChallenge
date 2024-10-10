import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Diabetes extends StatelessWidget {
  final AppRouter appRouter;
  const Diabetes({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Shopping',
          theme: ThemeData(
            primaryColor: ColorsManager.mainColor,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home: Scaffold(
            body:  Card(
              color: ColorsManager.mainColor,
              child: const Center(
                child: Text('Diabetes'),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
