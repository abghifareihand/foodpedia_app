import 'package:foodpedia_app/data/models/food_response_model.dart';

class TransactionResponseModel {
  final FoodResponseModel food;
  final String id;
  final int quantity;
  final int price;


  TransactionResponseModel({
    required this.food,
    this.id = '',
    required this.quantity,
    required this.price,
  });

  factory TransactionResponseModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionResponseModel(
        food: FoodResponseModel.fromJson(json['food']['id'], json['food']),
        id: id,
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price": price,
      };
}
