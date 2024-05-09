import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/food_response_model.dart';

class FoodRemoteDatasource {
  final CollectionReference _foodReference =
      FirebaseFirestore.instance.collection('foods');

  Future<Either<String, List<FoodResponseModel>>> getFood() async {
    try {
      QuerySnapshot result = await _foodReference.get();
      List<FoodResponseModel> foods = result.docs.map((doc) {
        return FoodResponseModel.fromJson(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
      List<Map<String, dynamic>> foodMaps =
          foods.map((food) => food.toJson()).toList();
      print(foodMaps);
      return Right(foods);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
