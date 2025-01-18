import 'package:flutter/material.dart';
import 'package:v_care_app/core/helpers/my_spacer.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        MySpacer.vertical(2),
        buildValidationRow('At least 1 uppercse letter', hasUpperCase),
        MySpacer.vertical(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacter),
        MySpacer.vertical(2),
        buildValidationRow('At least 1 number', hasNumber),
        MySpacer.vertical(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.grey,
        ),
        MySpacer.horizontal(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.grey : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
