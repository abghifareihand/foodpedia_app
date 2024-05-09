part of 'transaction_bloc.dart';

abstract class TransactionState {}

final class TransactionInitial extends TransactionState {}


final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  final List<TransactionResponseModel> transactionResponse;
  TransactionLoaded({required this.transactionResponse});
}

final class TransactionError extends TransactionState {
  final String message;
  TransactionError({required this.message});
}