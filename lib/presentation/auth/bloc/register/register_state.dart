part of 'register_bloc.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final UserResponseModel userResponse;
  RegisterLoaded({required this.userResponse});
}

final class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message});
}
