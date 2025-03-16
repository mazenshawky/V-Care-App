import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/helpers/extensions.dart';
import 'package:v_care_app/core/routing/routes.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/core/theming/styles.dart';
import 'package:v_care_app/features/login/logic/cubit/login_cubit.dart';
import 'package:v_care_app/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (_) => false);
          },
          error: (error) {
            setupErrorState(context, error);

          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
