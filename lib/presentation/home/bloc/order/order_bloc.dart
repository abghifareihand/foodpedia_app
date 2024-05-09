


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/transaction_remote_datasource.dart';
import 'package:foodpedia_app/data/models/transaction_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<CreateOrderEvent>((event, emit) async {
     emit(OrderLoading());
      final result =
          await TransactionRemoteDatasource().createTransaction(event.transaction);
      result.fold(
        (error) => emit(OrderError(message: error)),
        (success) => emit(OrderLoaded(message: success)),
      );
    });
  }
}
