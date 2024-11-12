import 'package:challenge/core/di/dependency_injection.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:challenge/core/routings/app_router.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/theming/colors.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/doctors/logic/popular_doctors_cubit.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/medical_record/logic/medical_record_cubit.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:challenge/features/payment/logic/payment_cubit.dart';
import 'package:challenge/features/settings/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/payment/data/repo/checkout_repo_impl.dart';

class Diabetes extends StatelessWidget {
  final AppRouter appRouter;
  const Diabetes({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getit<DoctorsCubit>()..getDoctors(),
            ),
            BlocProvider(
              create: (context) => getit<PopularDoctorsCubit>()..getPopularDoctors(),
            ),
            BlocProvider(
              create: (context) => getit<MedicineCubit>()..getMedicine(),
            ),
            BlocProvider(
              create: (context) =>
                  getit<MeasurmentsCubit>()..fetchSugarData(formattedDate),
            ),
            BlocProvider(
              create: (context) =>
                  getit<WeightCubit>()..fetchWeightData(formattedDate),
            ),
            BlocProvider(
              create: (context) =>
                  getit<PressureCubit>()..fetchPressureData(formattedDate),
            ),
            BlocProvider(
              create: (context) => PaymentCubit(CheckoutRepoImpl()),
            ),
            BlocProvider(
              create: (context) => getit<ProfileCubit>()..getUserData(),
            ),  
            BlocProvider(
              create: (context) => getit<FavouriteCubit>()..getFavourites(),
            ),
            BlocProvider(
              create: (context) => getit<MedicalRecordCubit>()..getMedicalRecord()..getDeleteMedicalRecord(),
            ),
          ],
          child: ConnectivityAppWrapper(
            app: MaterialApp(
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
              initialRoute: Routers.splashScreen,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
               builder: (buildContext, widget) {
                return ConnectivityWidgetWrapper(
                  disableInteraction: true,
                  height: 80,
                  child: widget!,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
