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
      child: ListView.builder(
        itemCount: user.orders?.length ?? 0,
        itemBuilder: (context, index) {
          final order = user.orders![index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubTitleText(text: "بسعر ${order.price}"),
                    TitleTexts(
                        text: order.quantity != null
                            ? "${order.pName}"
                            : "اضافة ${order.pName}"),
                  ],
                ),
                SizedBox(
                  child: order.quantity == null
                      ? null
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleTexts(
                                text:
                                    "الاجمالي ${(order.getTotalPrice()).round()} جنيه"),
                            const SizedBox(width: 20),
                            SubTitleText(text: "عدد ( ${order.quantity} )"),
                          ],
                        ),
                ),
                CustomDivider(
                  thickness: CustomSize().widthSize(context, .01),
                  color: AppColors.blackColor,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
