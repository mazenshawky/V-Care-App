import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/features/home/data/models/specializations_response_model.dart';
import 'package:v_care_app/features/home/logic/home_cubit.dart';
import 'package:v_care_app/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView(
      {super.key, required this.specializationsDataList});

  final List<SpecializationsData?> specializationsDataList;

  @override
  State<SpecialityListView> createState() =>
      _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                    specializationId: widget.specializationsDataList[index]?.id,
                  );
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationsDataList[index],
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
