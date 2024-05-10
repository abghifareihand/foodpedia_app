import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/core/constants/formatter.dart';
import 'package:foodpedia_app/data/models/food_response_model.dart';
import 'package:foodpedia_app/data/models/transaction_response_model.dart';
import 'package:foodpedia_app/presentation/home/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  final FoodResponseModel food;
  const CartPage({super.key, required this.food});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Cart Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              /// Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  height: 80,
                  width: 80,
                  widget.food.image!,
                  fit: BoxFit.cover,
                ),
              ),

              const SpaceWidth(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpaceHeight(4),
                  Text(
                    priceFormat(widget.food.price),
                    style: blackTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpaceHeight(8),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.food.rating ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // Lakukan sesuatu ketika rating diperbarui
                        },
                      ),
                      const SpaceWidth(8),
                      Text(
                        widget.food.rating.toString(),
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SpaceHeight(40),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _quantityController,
            decoration: InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SpaceHeight(20),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            int quantity = int.parse(_quantityController.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(
                  transaction: TransactionResponseModel(
                    food: widget.food,
                    quantity: quantity,
                    price: widget.food.price! * quantity,
                  ),
                ),
              ),
            );
          },
          child: const Text('Continue Checkout'),
        ),
      ),
    );
  }
}
