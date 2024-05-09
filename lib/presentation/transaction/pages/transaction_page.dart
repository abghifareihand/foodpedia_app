import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodpedia_app/core/constants/colors.dart';
import 'package:foodpedia_app/core/constants/formatter.dart';
import 'package:foodpedia_app/presentation/transaction/bloc/transaction/transaction_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionBloc>().add(GetTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.primary,
        onRefresh: () async {
          context.read<TransactionBloc>().add(GetTransactionEvent());
        },
        child: ListView(
          children: [
            BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionLoaded) {
                  final transaction = state.transactionResponse;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transaction.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 2,
                        color: AppColor.grey.withOpacity(0.2),
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(transaction[index].food.name!),
                        subtitle: Text(priceFormat(transaction[index].price)),
                      );
                    },
                  );
                }

                if (state is TransactionError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is TransactionLoading) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: AppColor.primary,
                    ),
                  );
                }
                // Initial
                return const Center(
                  child: SpinKitFadingCircle(
                    color: AppColor.primary,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
