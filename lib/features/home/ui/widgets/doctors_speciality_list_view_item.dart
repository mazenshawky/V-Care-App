import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v_care_app/core/app_assets/app_assets.dart';
import 'package:v_care_app/core/helpers/my_spacer.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/features/home/data/models/specializations_response_model.dart';

import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  const DoctorsSpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
  });

  final SpecializationsData? specializationsData;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lightBlue,
            child: SvgPicture.asset(
              SvgsAssets.generalSpeciality,
              height: 40.h,
              width: 40.w,
            ),
          ),
          MySpacer.vertical(8),
          Text(
            specializationsData?.name ?? 'Specialization',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
