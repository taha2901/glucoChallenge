import 'dart:async';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/extentions.dart';
import 'package:challenge/core/helpers/spacing.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      isLoggedInUser
          ? context.pushReplacementNamed(Routers.layoutShop)
          : context.pushReplacementNamed(Routers.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsManager.mainColor,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Challenge Diabetes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/splash_logo2.png',
                            width: 100.w,
                            height: 100.h,
                          ).animate().fadeIn(duration: 1.seconds).scale(
                              begin: Offset(0.5, 0.5), duration: 1.seconds),
                          horizontalSpace(8),
                          Text(
                            'Health care',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Splash_logo.png',
                    width: 150.w,
                    height: 150.h,
                  )
                      .animate()
                      .fadeIn(duration: 1.seconds)
                      .scale(begin: Offset(0.5, 0.5), duration: 1.seconds),
                ],
              ),
              verticalSpace(36),
              Image.asset(
                'assets/images/LOGO_SPLASH.png',
                width: 150.w,
                height: 150.h,
              ).animate().fadeIn(duration: 1.seconds).scale(
                  begin: Offset(0.5, 0.5),
                  duration: 1.seconds), // أنيميشن التلاشي والتكبير
            ],
          ),
        ),
      ),
    );
  }
}
