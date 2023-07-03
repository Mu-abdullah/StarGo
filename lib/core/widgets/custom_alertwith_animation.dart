import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/widgets/custom_button.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';

void customAlertWithAnimation(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: const Align(
            alignment: Alignment.centerRight,
            child: TitleTexts(
              text: "طلب جديد",
              titleColor: AppColors.blackColor,
            ),
          ),
          content: const SubTitleText(
            text: "يوجد طلب جديد",
            subTitleColor: AppColors.blackColor,
          ),
          actions: <Widget>[
            Container(
              width: CustomSize().widthSize(context, .75),
              height: CustomSize().heightSize(context, .25),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Lottie.asset("assets/animation_json/new_order.json",
                  filterQuality: FilterQuality.high),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPress: () {
                Navigator.pop(context);
              },
              backgroungColor: AppColors.blackColor,
              titleColor: AppColors.primaryColor,
              buttonName: "شكراً",
            ),
          ],
        ),
      );
    },
  );
}
