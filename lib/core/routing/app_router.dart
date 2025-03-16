import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/di/dependency_injection.dart';
import 'package:v_care_app/core/routing/routes.dart';
import 'package:v_care_app/features/home/logic/home_cubit.dart';
import 'package:v_care_app/features/home/ui/home_screen.dart';
import 'package:v_care_app/features/login/logic/cubit/login_cubit.dart';
import 'package:v_care_app/features/login/ui/login_screen.dart';
import 'package:v_care_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:v_care_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:v_care_app/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
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
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecializations(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}