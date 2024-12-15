import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/core/widget/bottom_nav_bar.dart';
import 'package:challenge/features/add_person/ui/add_person.dart';
import 'package:challenge/features/chat_bot/my_bot.dart';
import 'package:challenge/features/doctors/data/model/doctor_response_body.dart';
import 'package:challenge/features/doctors/ui/doctor_screen.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/confirm_dotor_reservation.dart';
import 'package:challenge/features/doctors/ui/widgets/reservation/doctor_reservation.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/favourite/ui/favourite_screen.dart';
import 'package:challenge/features/home/ui/home_screen.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/login/ui/login_screen.dart';
import 'package:challenge/features/measurments/ui/measurements_screen.dart';
import 'package:challenge/features/medical_record/ui/my_medical_record.dart';
import 'package:challenge/features/medicine/ui/add_medicine_screen.dart';
import 'package:challenge/features/onboard/ui/onboarding.dart';
import 'package:challenge/features/register/logic/register_cubit.dart';
import 'package:challenge/features/register/ui/register.dart';
import 'package:challenge/features/settings/ui/profile_screen.dart';
import 'package:challenge/features/settings/ui/widgets/update_user_data_screen.dart';
import 'package:challenge/features/sports/ui/exercise.dart';
import 'package:challenge/splash_screen.dart';
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
            create: (context) => getit<RegisterCubit>(),
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

      case Routers.addPerson:
        return MaterialPageRoute(
          builder: (_) => const AddPerson(),
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

      case Routers.addMedicine:
        return MaterialPageRoute(
          builder: (_) => const AddMedicineScreen(),
        );
      case Routers.confirmDoctorResrvation:
        return MaterialPageRoute(
          builder: (_) => ConfirmDoctorReservation(),
        );

      // case Routers.myMedicalRecord:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getit<MedicalRecordCubit>()..getMedicalRecord()..getDeleteMedicalRecord(),
      //       child: MyMedicalRecord(),
      //     ),
      //   );
       case Routers.myMedicalRecord:
        return MaterialPageRoute(
          builder: (_) => MyMedicalRecord(),
        );

      case Routers.measurement:
        return MaterialPageRoute(
          builder: (_) => const MeasurementsScreen(),
        );

      case Routers.exercise:
        return MaterialPageRoute(
          builder: (_) => const ExerciseScreen(),
        );

      case Routers.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      case Routers.updateProfile:
        return MaterialPageRoute(
          builder: (_) => UpdateUserDataScreen(),
        );
      case Routers.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routers.chatbot:
        return MaterialPageRoute(
          builder: (_) => const MyBot(),
        );

      case Routers.favourite:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<FavouriteCubit>()..getFavourites(),
            child: const FavouriteScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
