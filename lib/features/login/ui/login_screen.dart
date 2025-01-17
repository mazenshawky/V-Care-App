import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/core/helpers/spacer.dart';
import 'package:v_care_app/core/theming/styles.dart';
import 'package:v_care_app/core/widgets/my_text_button.dart';
import 'package:v_care_app/features/login/data/models/login_request_body.dart';
import 'package:v_care_app/features/login/logic/cubit/login_cubit.dart';
import 'package:v_care_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:v_care_app/features/login/ui/widgets/email_and_password.dart';
import 'package:v_care_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:v_care_app/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                MySpacer.vertical(8),
                Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: TextStyles.font14GreyRegular),
                MySpacer.vertical(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    MySpacer.vertical(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    MySpacer.vertical(40),
                    MyTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    MySpacer.vertical(16),
                    const TermsAndConditionsText(),
                    MySpacer.vertical(60),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      var loginRequestBody = LoginRequestBody(
        email: context.read<LoginCubit>().emailController.text,
        password: context.read<LoginCubit>().passwordController.text,
      );
      context.read<LoginCubit>().emitLoginStates(loginRequestBody);
    }
  }
}
