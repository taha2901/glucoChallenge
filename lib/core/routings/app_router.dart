import 'package:challenge/core/di/dependency_injection.dart';
import 'package:challenge/core/routings/routers.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/login/ui/login_screen.dart';
import 'package:challenge/features/onboard/ui/onboarding.dart';
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
      // case Routers.register:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getit<RegisterCubit>(),
      //       child: const RegisterScreen(),
      //     ),
      //   );
      // case Routers.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const LayoutShop(),
      //   );

      default:
        return null;
    }
  }
}
