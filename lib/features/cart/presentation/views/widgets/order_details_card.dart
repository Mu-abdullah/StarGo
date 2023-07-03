import 'package:flutter/material.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_divider.dart';

import '../../../data/model/user_model/user_model.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: user.orders?.length ?? 0,
        itemBuilder: (context, index) {
          final order = user.orders![index];

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SubTitleText(text: "عدد ( ${order.quantity} )"),
                  TitleTexts(text: "${order.pName}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitleTexts(
                      text: "الاجمالي ${(order.getTotalPrice()).round()} جنيه"),
                  const SizedBox(width: 20),
                  SubTitleText(text: "بسعر ${order.price}"),
                ],
              ),
              CustomDivider(
                thickness: CustomSize().widthSize(context, .01),
                color: AppColors.blackColor,
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5);
        },
      ),
    );
  }
}
