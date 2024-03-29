part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final LoginResponseModel model;
  LoginLoaded(this.model);
}

final class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
