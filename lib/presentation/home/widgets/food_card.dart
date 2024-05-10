import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/core/constants/formatter.dart';
import 'package:foodpedia_app/data/models/food_response_model.dart';
import 'package:foodpedia_app/presentation/home/pages/food_detail_page.dart';

class FoodCard extends StatelessWidget {
  final FoodResponseModel food;
  const FoodCard({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FoodDetailPage(food: food);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Row(
          children: [
            /// Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                height: 80,
                width: 80,
                food.image ?? 'No Image',
                fit: BoxFit.cover,
              ),
            ),

            const SpaceWidth(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpaceHeight(4),
                  Text(
                    priceFormat(food.price),
                    style: blackTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            RatingBar.builder(
              initialRating: food.rating ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 16,
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
              food.rating.toString(),
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
