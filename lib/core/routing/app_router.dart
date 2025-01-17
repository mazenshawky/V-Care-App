import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/di/dependency_injection.dart';
import 'package:v_care_app/core/routing/routes.dart';
import 'package:v_care_app/features/home/ui/home_screen.dart';
import 'package:v_care_app/features/login/logic/cubit/login_cubit.dart';
import 'package:v_care_app/features/login/ui/login_screen.dart';
import 'package:v_care_app/features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('No route found')),
      ),
    );
  }
}
