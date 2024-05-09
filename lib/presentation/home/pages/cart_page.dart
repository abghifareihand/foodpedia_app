import 'package:flutter/material.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Cart Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                height: 40,
                width: 40,
                widget.food.image ?? 'No Image',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(widget.food.name!),
            subtitle: Text(priceFormat(widget.food.price)),
          ),
          const SpaceHeight(20),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _quantityController,
            decoration: InputDecoration(
              labelText: 'Masukkan Jumlah Pesanan',
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
