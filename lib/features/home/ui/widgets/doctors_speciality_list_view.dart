import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/features/home/data/models/specializations_response_model.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView(
      {super.key, required this.specializationsDataList});

  final List<SpecializationsData?> specializationsDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationsData: specializationsDataList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
