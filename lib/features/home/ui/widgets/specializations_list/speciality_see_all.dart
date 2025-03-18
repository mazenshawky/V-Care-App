import 'package:flutter/widgets.dart';
import 'package:v_care_app/core/theming/styles.dart';

class SpecialitySeeAll extends StatelessWidget {
  const SpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
