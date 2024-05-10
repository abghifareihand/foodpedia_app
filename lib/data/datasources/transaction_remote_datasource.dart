import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodpedia_app/data/models/transaction_response_model.dart';

class TransactionRemoteDatasource {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  final _user = FirebaseAuth.instance.currentUser;

  Future<Either<String, String>> createTransaction(
      TransactionResponseModel transaction) async {
    try {
      await _transactionReference.doc(_user!.uid).collection(_user.uid).add({
        'food': transaction.food.toJson(),
        'quantity': transaction.quantity,
        'price': transaction.price,
      });
      return const Right('Create Transaction Success');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<TransactionResponseModel>>> getTransaction(
      String userId) async {
    try {
      QuerySnapshot result =
          await _transactionReference.doc(userId).collection(_user!.uid).get();

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
