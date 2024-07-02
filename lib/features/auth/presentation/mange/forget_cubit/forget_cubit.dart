import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit_coach/core/errors/data/model/failures.dart';
import 'package:well_fit_coach/core/functions/password_length_checker.dart';
import 'package:well_fit_coach/core/utils/api_service.dart';
import 'package:well_fit_coach/core/utils/secure_storage.dart';
import 'package:well_fit_coach/core/utils/service_locator.dart';
import 'package:well_fit_coach/features/auth/data/models/forget_password_response/forget_password_response.dart';
import 'package:well_fit_coach/features/auth/data/models/token_model/token_model.dart';
import 'package:well_fit_coach/features/auth/data/models/update_password/update_password.dart';
import 'package:well_fit_coach/features/auth/data/models/verify_code_response/verify_code_response.dart';
import 'package:well_fit_coach/features/auth/data/repo/forget_repo/forget_repo_impl.dart';
import 'package:well_fit_coach/features/auth/data/repo/set_password_repo/set_password_impl.dart';
import 'package:well_fit_coach/features/auth/data/repo/verify_email_repo/verify_email_repo.dart';
import 'package:well_fit_coach/features/auth/presentation/mange/forget_cubit/forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());
  final ForgetRepoImpl _forgetRepoImpl =
      ForgetRepoImpl(getIt.get<ApiService>());
  final VerifyEmailRepoImpl _verifyEmailRepoImpl =
      VerifyEmailRepoImpl(getIt.get<ApiService>());
  final SetPasswordImpl _setPasswordImpl =
      SetPasswordImpl(getIt.get<ApiService>());

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPassword = TextEditingController();

  bool obscurePassword = true,
      obscureConfirmPassword = true,
      rememberMe = false,
      confirmNewPassword = false,
      confirmPinCode = false;

  String pinCode = "";

  PageController pageController = PageController();
  int pageControllerIndex = 0;
  List<bool> strengthCriteria = [false, false, false, false, false];

  Future<void> forgetPassword({
    required Function(Failure error) onError,
    required Function(ForgetPassResponse response) onSuccess,
  }) async {
    emit(LoadingState());
    var data = await _forgetRepoImpl.forgetPassword(
      email: emailController.text,
    );
    data.fold((error) {
      onError(error);
      emit(ErrorState());
    }, (response) {
      onSuccess(response);
      emit(SuccessState());
    });
  }

  Future<void> verifyEmail({
    required Function(Failure error) onError,
    required Function(VerifyCodeResponse response) onSuccess,
  }) async {
    emit(LoadingState());
    var data = await _verifyEmailRepoImpl.verifyEmail(
        email: emailController.text, pinCode: pinCode);
    data.fold((error) {
      onError(error);
      emit(ErrorState());
    }, (response) {
      onSuccess(response);
      emit(SuccessState());
    });
  }

  Future<void> setNewPassword({
    required Function(Failure error) onError,
    required Function(UpdatePassword response) onSuccess,
  }) async {
    emit(LoadingState());
    TokenModel? tokenModel = await SecureStorage().readSecureData();
    var data = await _setPasswordImpl.setNewPassword(
        password: passwordController.text, tokenModel: tokenModel!);
    data.fold((error) {
      onError(error);
      emit(ErrorState());
    }, (response) {
      onSuccess(response);
      emit(SuccessState());
    });
  }

  void getPasswordObscure() {
    obscurePassword = !obscurePassword;
    emit(SetState());
  }

  void getConfirmPasswordObscure() {
    obscureConfirmPassword = !obscureConfirmPassword;
    emit(SetState());
  }

  void setPageIndex(value) {
    pageControllerIndex = value;
    emit(SetState());
  }

  void pinCodeChecker(String value) {
    confirmPinCode = (value.length == 4);
    emit(SetState());
  }

  void passwordStrengthChecker(dynamic value) {
    strengthCriteria = checkPasswordStrength(value);
    confirmNewPassword = strengthCriteria[0] &&
        strengthCriteria[1] &&
        strengthCriteria[2] &&
        strengthCriteria[3] &&
        strengthCriteria[4] &&
        (confirmPassword.text == passwordController.text);
    emit(SetState());
  }

  void confirmPasswordOnChange(dynamic value) {
    confirmNewPassword = strengthCriteria[0] &&
        strengthCriteria[1] &&
        strengthCriteria[2] &&
        strengthCriteria[3] &&
        strengthCriteria[4] &&
        (confirmPassword.text == passwordController.text);
    emit(SetState());
  }
}
