import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:foodpedia_app/data/models/transaction_response_model.dart';

class TransactionRemoteDatasource {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<Either<String, String>> createTransaction(
      TransactionResponseModel transaction) async {
    try {
      _transactionReference.add({
        'food': transaction.food.toJson(),
        'quantity': transaction.quantity,
        'price': transaction.price,
      });

      return const Right('Create Transaction Success');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<TransactionResponseModel>>> getTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionResponseModel> transaction = result.docs.map((doc) {
        return TransactionResponseModel.fromJson(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
     
      return Right(transaction);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
