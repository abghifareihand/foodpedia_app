part of 'food_bloc.dart';


abstract class FoodState {}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

final class FoodLoaded extends FoodState {
  final List<FoodResponseModel> foodResponse;
  FoodLoaded({required this.foodResponse});
}

final class FoodError extends FoodState {
  final String message;
  FoodError({required this.message});
}