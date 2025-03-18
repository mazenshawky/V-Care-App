import 'package:flutter/material.dart';
import 'package:v_care_app/core/helpers/my_spacer.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_list/doctors_blue_container.dart';
import 'package:v_care_app/features/home/ui/widgets/specializations_list/speciality_see_all.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_list/doctros_bloc_builder.dart';
import 'package:v_care_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:v_care_app/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';

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
              MySpacer.vertical(24),
              const SpecialitySeeAll(),
              MySpacer.vertical(18),
              const SpecializationsBlocBuilder(),
              MySpacer.vertical(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
