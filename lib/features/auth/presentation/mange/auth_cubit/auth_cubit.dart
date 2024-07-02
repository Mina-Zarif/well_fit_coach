import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/core/utils/service_locator.dart';
import 'package:well_fit_coach/features/auth/data/models/login_request/login_request.dart';
import 'package:well_fit_coach/features/auth/data/models/login_response/login_response.dart';
import 'package:well_fit_coach/features/auth/data/repo/login_repo/login_repo_impl.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final LoginRepoImpl _loginRepoImpl = LoginRepoImpl(getIt.get<ApiService>());

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  bool obscurePassword = true, rememberMe = false;

  Future<void> loginProcess({
    required Function(LoginResponse response) onSucess,
    required Function(Failure error) onError,
  }) async {
    emit(LoadingLoginState());
    var data = await _loginRepoImpl.login(
      loginRequest: LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    data.fold((error) {
      onError(error);
      emit(ErrorLoginState());
    }, (response) {
      onSucess(response);
      emit(SuccessLoginState());
    });
  }

  void getPasswordObscure() {
    obscurePassword = !obscurePassword;
    emit(SetState());
  }

  void rememberMeCheck() {
    rememberMe = !rememberMe;
    emit(SetState());
  }
}
