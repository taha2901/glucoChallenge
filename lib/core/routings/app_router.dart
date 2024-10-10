import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // case Routers.login:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getit<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );
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
