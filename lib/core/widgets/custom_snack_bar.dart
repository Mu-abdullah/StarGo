import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/texts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  context, {
  required String contentText,
  required int seconds,
  Color backgroundColor = AppColors.blackColor,
  Color titleColor = AppColors.primaryColor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
    content: TitleTexts(text: contentText, titleColor: titleColor),
    duration: Duration(seconds: seconds),
  ));
}
