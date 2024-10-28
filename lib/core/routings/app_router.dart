import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/widget/bottom_nav_bar.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/ui/doctor_screen.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/doctor_reservation.dart';
import 'package:challenge/features/home/ui/home_screen.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/login/ui/login_screen.dart';
import 'package:challenge/features/measurments/ui/measurements_screen.dart';
import 'package:challenge/features/medicine/ui/add_medicine_screen.dart';
import 'package:challenge/features/onboard/ui/onboarding.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:challenge/features/register/ui/register.dart';
import 'package:challenge/features/settings/ui/profile_screen.dart';
import 'package:challenge/features/settings/ui/widgets/update_user_data_screen.dart';
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
      case Routers.layoutShop:
        return MaterialPageRoute(
          builder: (_) => const LayoutShop(),
        );
      case Routers.home:
        return MaterialPageRoute(
          builder: (_) => const LayoutShop(),
        );
      case Routers.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routers.doctors:
        return MaterialPageRoute(
          builder: (_) => const DoctorScreen(),
        );

      case Routers.doctorResrvation:
        final doctorResponseBody = arguments as DoctorResponseBody;
        int doctorId = doctorResponseBody.id;
        debugPrint('doctorId in routers is: $doctorId');
        return MaterialPageRoute(
          builder: (_) => DoctorReservation(
            doctorId: doctorId,
            doctorResponseBody: doctorResponseBody,
          ),
        );

      // case Routers.medicine:
      //   return MaterialPageRoute(
      //     builder: (_) => const MedicineScreen(),
      //   );

      case Routers.addMedicine:
        return MaterialPageRoute(
          builder: (_) => const AddMedicineScreen(),
        );
      case Routers.confirmDoctorResrvation:
        return MaterialPageRoute(
          builder: (_) =>  ConfirmDoctorReservation(),
        );

      case Routers.measurement:
        return MaterialPageRoute(
          builder: (_) => const MeasurementsScreen(),
        );

      case Routers.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      case Routers.updateProfile:
        return MaterialPageRoute(
          builder: (_) => UpdateUserDataScreen(),
        );

      default:
        return null;
    }
  }
}
