import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/networking/api_error_handler.dart';
import 'package:v_care_app/features/home/logic/home_cubit.dart';
import 'package:v_care_app/features/home/logic/home_state.dart';

import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorsError: (errorHandler) => setupError(errorHandler),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(doctorsList) {
    return DoctorsListView(
      doctorsList: doctorsList,
    );
  }

  Widget setupError(ErrorHandler errorHandler) {
    return Center(
      child: Text(errorHandler.apiErrorModel.message ?? "Unknown Error"),
    );
  }
}
