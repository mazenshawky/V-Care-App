import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/helpers/my_spacer.dart';
import 'package:v_care_app/core/networking/api_error_handler.dart';
import 'package:v_care_app/features/home/data/models/specializations_response_model.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:v_care_app/features/home/ui/widgets/doctors_speciality_list_view.dart';

import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationsLoading: () {
              return setupLoading();
            },
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList =
                  specializationsResponseModel.specializationDataList;
              return setupSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setupError(errorHandler),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationsDataList: specializationsList ?? [],
          ),
          MySpacer.vertical(8),
          DoctorsListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setupError(ErrorHandler errorHandler) {
    return Center(
      child: Text(errorHandler.apiErrorModel.message ?? "Unknown Error"),
    );
  }
}
