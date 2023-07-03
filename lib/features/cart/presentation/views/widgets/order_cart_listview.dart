import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_circle_progress.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/error_get_data.dart';
import '../../manger/order_cubit/order_screen_cubit.dart';
import 'order_cart_item.dart';

class OrderCardListView extends StatefulWidget {
  const OrderCardListView({
    super.key,
  });

  @override
  State<OrderCardListView> createState() => _OrderCardListViewState();
}

class _OrderCardListViewState extends State<OrderCardListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderScreenCubit, OrderScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Success) {
          if (state.allOrders.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/animation_json/empty.json"),
                const Align(
                    alignment: Alignment.center,
                    child: TitleTexts(text: "لا يوجد طلبات حالياً")),
              ],
            );
          } else {
            return Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.allOrders.length,
                itemBuilder: (context, index) {
                  final user = state.allOrders[index];
                  return OrderCartItem(user: user);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    CustomDivider(
                  color: AppColors.blueColor,
                  thickness: CustomSize().heightSize(context, .002),
                ),
              ),
            );
          }
        } else if (state is Loading) {
          return const CustomProgressIndecator();
        } else {
          return const ErrorGetData();
        }
      },
    );
  }
}
