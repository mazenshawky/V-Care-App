import 'package:flutter/material.dart';
import 'package:v_care_app/core/theming/app_colors.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:v_care_app/features/home/ui/widgets/home_top_bar.dart';

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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
