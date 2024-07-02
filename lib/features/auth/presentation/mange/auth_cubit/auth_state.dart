abstract class AuthState {}

class AuthInitial extends AuthState {}

class SetState extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {}

class ErrorLoginState extends AuthState {}
