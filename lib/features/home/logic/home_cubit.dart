import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/helpers/extensions.dart';
import 'package:v_care_app/core/networking/api_error_handler.dart';
import 'package:v_care_app/features/home/data/models/specializations_response_model.dart';
import 'package:v_care_app/features/home/data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
}
