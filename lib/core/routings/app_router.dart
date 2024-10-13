import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/features/doctors/ui/doctor_screen.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/doctor_reservation.dart';
import 'package:challenge/features/home/ui/home_screen.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/login/ui/login_screen.dart';
import 'package:challenge/features/onboard/ui/onboarding.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:challenge/features/register/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routers.onBaord:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routers.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routers.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      // case Routers.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const LayoutShop(),
      //   );
      case Routers.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routers.doctors:
        return MaterialPageRoute(
          builder: (_) => const DoctorScreen(),
        );

      case Routers.doctorResrvation:
        return MaterialPageRoute(
          builder: (_) => const DoctorReservation(),
        );

      case Routers.confirmDoctorResrvation:
        return MaterialPageRoute(
          builder: (_) => const ConfirmDoctorReservation(),
        );

      default:
        return null;
    }
  }
}
