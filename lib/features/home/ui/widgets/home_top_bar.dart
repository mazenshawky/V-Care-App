import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_care_app/core/app_assets/app_assets.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Mazen!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GreyRegular,
            ),
          ],
        ),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: AppColors.moreLighterGray,
          child: SvgPicture.asset(
            SvgsAssets.notifications,
          ),
        )
      ],
    );
  }
}
