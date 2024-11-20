import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/core/helpers/spacer.dart';
import 'package:v_care_app/core/theming/styles.dart';
import 'package:v_care_app/core/widgets/my_text_button.dart';
import 'package:v_care_app/core/widgets/my_text_form_field.dart';
import 'package:v_care_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:v_care_app/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextFormField(hintText: 'Email'),
                      MySpacer.vertical(18),
                      MyTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
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
                        onPressed: () {},
                      ),
                      MySpacer.vertical(16),
                      const TermsAndConditionsText(),
                      MySpacer.vertical(60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
