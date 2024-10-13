import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Diabetes extends StatelessWidget {
  final AppRouter appRouter;
  const Diabetes({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          title: 'Challenge Diabetes',
          theme: ThemeData(
            primaryColor: ColorsManager.mainColor,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          initialRoute: Routers.home,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
