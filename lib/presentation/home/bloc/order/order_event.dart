part of 'order_bloc.dart';

abstract class OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final TransactionResponseModel transaction;
  CreateOrderEvent({required this.transaction});
}
