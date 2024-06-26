

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/transaction_remote_datasource.dart';
import 'package:foodpedia_app/data/models/transaction_response_model.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<GetTransactionEvent>((event, emit) async {
      emit(TransactionLoading());
      final user = FirebaseAuth.instance.currentUser;
      final result =
          await TransactionRemoteDatasource().getTransaction(user!.uid);
      result.fold(
        (error) => emit(TransactionError(message: error)),
        (success) => emit(TransactionLoaded(transactionResponse: success)),
      );
    });
  }
}
