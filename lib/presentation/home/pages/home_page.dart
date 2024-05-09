import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodpedia_app/core/components/spaces.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/presentation/auth/bloc/user/user_bloc.dart';
import 'package:foodpedia_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodpedia_app/presentation/home/widgets/banner_slider.dart';
import 'package:foodpedia_app/presentation/home/widgets/food_card.dart';

import '../widgets/food_card_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<FoodBloc>().add(GetFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: RefreshIndicator(
        color: AppColor.primary,
        onRefresh: () async {
          context.read<FoodBloc>().add(GetFoodEvent());
        },
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// User
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              if (state is UserLoaded) {
                                return Text(
                                  state.userResponse.name!,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
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
                          Icons.shopping_cart,
                          color: AppColor.black,
                        ),
                      ),
                      const SpaceWidth(12),
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
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.notifications,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const BannerSlider(),
            BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodLoaded) {
                  final foods = state.foodResponse;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: foods.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 2,
                        color: AppColor.grey.withOpacity(0.2),
                      );
                    },
                    itemBuilder: (context, index) {
                      return FoodCard(
                        food: foods[index],
                      );
                    },
                  );
                }

                if (state is FoodError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is FoodLoading) {
                  return const FoodCardShimmer();
                }
                // Initial
                return const FoodCardShimmer();
              },
            )
          ],
        ),
      ),
    );
  }
}
