import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_care_app/core/app_assets/app_assets.dart';
import 'package:v_care_app/core/theming/styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(SvgsAssets.docdocLogo),
        SizedBox(width: 10.w),
        Text('DocDoc', style: TextStyles.font24Black700Weight),
        SizedBox(height: 30.h),
      ],
    );
  }
}
