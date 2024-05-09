import 'package:flutter/material.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class FoodCardShimmer extends StatelessWidget {
  const FoodCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 2,
          color: AppColor.grey.withOpacity(0.2),
        );
      },
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  height: 80,
                  width: 80,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 120,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 14,
                        width: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
