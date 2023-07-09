import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:seller/core/utils/app_routs.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';

import '../../../data/model/user_model/user_model.dart';

class OrderCartItem extends StatelessWidget {
  const OrderCartItem({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    Timestamp? timestamp = user.timeOfOrder;

    DateTime dateTime = timestamp?.toDate() ?? DateTime.now();

    String formattedTime = DateFormat('MM/d  ,   h:mm a').format(dateTime);

    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushReplacement(AppRouter.showOrderBottomScreen, extra: user);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: AppColors.blackColor,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: CustomSize().widthSize(context, 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.blackColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTexts(
                    text: "${user.userName}",
                    titleColor: AppColors.whiteColor,
                  ),
                  TitleTexts(
                      text: "${user.userphone}",
                      titleColor: AppColors.whiteColor),
                  TitleTexts(
                      text: "${user.userAdress}",
                      maxLines: 3,
                      titleColor: AppColors.whiteColor),
                  TitleTexts(
                      text: "تاريخ الطلب :  $formattedTime",
                      titleColor: AppColors.whiteColor),
                  TitleTexts(
                      text: "الطلبات : ${user.orders!.length.toString()}",
                      titleColor: AppColors.whiteColor),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: user.note!.length == 0
                        ? null
                        : TitleTexts(
                            text: "ملاحظات : ${user.note!}",
                            titleColor: AppColors.whiteColor),
                  ),
                  TitleTexts(
                      text: "الاجمالي : ${(user.totalPrice).round()} جنيه",
                      titleColor: AppColors.whiteColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
