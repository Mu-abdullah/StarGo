import 'package:flutter/material.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';

import 'order_cart_listview.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: CustomSize().widthSize(context, 1),
          height: CustomSize().heightSize(context, .1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: AppColors.primaryColor,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: TitleTexts(
              text: "الطلبات الجديدة",
              titleColor: AppColors.whiteColor,
              fontSize: 36,
            ),
          ),
        ),
        const OrderCardListView(),
      ],
    );
  }
}
