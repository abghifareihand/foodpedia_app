import 'package:flutter/material.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/core/constants/colors.dart';

class TransactionEmpty extends StatelessWidget {
  const TransactionEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: const Icon(
              Icons.shopping_bag,
              color: AppColor.black,
              size: 80,
            ),
          ),
          const SpaceHeight(12),
          Text(
            'Your Transaction is Empty',
            style: blackTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
