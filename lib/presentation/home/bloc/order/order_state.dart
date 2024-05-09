part of 'order_bloc.dart';

abstract class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoaded extends OrderState {
  final String message;
  OrderLoaded({required this.message});
}

final class OrderError extends OrderState {
  final String message;
  OrderError({required this.message});
}
