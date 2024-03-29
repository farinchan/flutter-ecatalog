part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final RegisterResponseModel model;
  RegisterLoaded(this.model);
}

final class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}
