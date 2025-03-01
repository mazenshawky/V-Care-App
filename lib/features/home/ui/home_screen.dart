import 'package:flutter/material.dart';
import 'package:v_care_app/core/theming/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
