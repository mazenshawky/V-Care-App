import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/core/helpers/my_spacer.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:v_care_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:v_care_app/features/home/ui/widgets/specializations_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              MySpacer.vertical(24.h),
              const DoctorsSpecialitySeeAll(),
              MySpacer.vertical(18),
              const SpecializationsAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
