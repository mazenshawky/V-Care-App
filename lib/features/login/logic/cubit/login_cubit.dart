import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_app/core/helpers/constants.dart';
import 'package:v_care_app/core/helpers/shared_pref_helper.dart';
import 'package:v_care_app/core/networking/dio_factory.dart';
import 'package:v_care_app/features/login/data/models/login_request_body.dart';
import 'package:v_care_app/features/login/data/repos/login_repo.dart';
import 'package:v_care_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());

    var loginRequestBody = LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    );

    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (loginResponse) async{
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
