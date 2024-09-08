import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_care_app/core/app_assets/app_assets.dart';
import 'package:v_care_app/core/theming/styles.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(SvgsAssets.docdocLogoLowOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(
            ImagesAssets.onboardingDoctor,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor\nAppointment App',
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
