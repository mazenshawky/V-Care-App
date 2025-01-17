import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/features/login/data/models/login_request_body.dart';
import 'package:v_care_app/features/login/data/repos/login_repo.dart';
import 'package:v_care_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (loginResonse) {
      emit(LoginState.success(loginResonse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
