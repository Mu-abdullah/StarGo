import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_divider.dart';
import 'package:seller/features/cart/data/model/user_model/user_model.dart';

import '../manger/pre_order_cubit/pre_order_cubit.dart';

class PrePareOrder extends StatelessWidget {
  const PrePareOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreOrderCubit()..fetchAllPrePareOrder(),
      child: BlocConsumer<PreOrderCubit, PreOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          var total = BlocProvider.of<PreOrderCubit>(context).total().round();
          var quantity = BlocProvider.of<PreOrderCubit>(context).quntity();
          List<UserModel> user = BlocProvider.of<PreOrderCubit>(context).user;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      width: CustomSize().widthSize(context, 1),
                      decoration: const BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: [
                            TitleTexts(
                              text:
                                  "اجمالي عدد الطلبات $quantity طلب باجمالي مبلغ $total جنيه",
                              fontSize: 24,
                              titleColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: PrepareOrderListView(user: user))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PrepareOrderListView extends StatelessWidget {
  const PrepareOrderListView({
    super.key,
    required this.user,
  });

  final List<UserModel> user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: user.length,
      itemBuilder: (context, index) => PrepareOrderItems(
        user: user[index],
      ),
    );
  }
}

class PrepareOrderItems extends StatelessWidget {
  const PrepareOrderItems({
    required this.user,
    super.key,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTexts(text: user.userName!),
              TitleTexts(
                  text: "اجمالي الطلب ( ${user.totalPrice.round()} ) جنيه"),
              SubTitleText(text: user.userphone!),
              SubTitleText(text: user.userAdress!),
              SizedBox(
                  child: user.note == null
                      ? null
                      : SubTitleText(text: user.note!)),
              CustomDivider(
                  thickness: CustomSize().widthSize(context, .01),
                  color: AppColors.blackColor),
              ListView.builder(
                itemCount: user.orders?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final orders = user.orders![index];
                  return Wrap(
                    children: orders.quantity == null
                        ? [
                            SubTitleText(
                                text: "عدد ( ${orders.quantity ?? "1"} ) "),
                            SubTitleText(text: "اضافة ${orders.pName!}بسعر "),
                            SubTitleText(
                                text: "( ${(orders.price)!.round()} ) جنيه"),
                            SubTitleText(
                                text:
                                    " باجمالي ( ${orders.getTotalPrice().round()} ) جنيه"),
                          ]
                        : [
                            SubTitleText(
                                text: "عدد ( ${orders.quantity ?? "1"} ) "),
                            SubTitleText(text: "${orders.pName!}بسعر "),
                            SubTitleText(
                                text: "( ${(orders.price)!.round()} ) جنيه"),
                            SubTitleText(
                                text:
                                    " باجمالي ( ${orders.getTotalPrice().round()} ) جنيه"),
                          ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
