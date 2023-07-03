import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_circle_progress.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class EditLoading extends StatefulWidget {
  const EditLoading({super.key});

  @override
  State<EditLoading> createState() => _EditLoadingState();
}

class _EditLoadingState extends State<EditLoading> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        GoRouter.of(context).pop();
        Future.delayed(
          const Duration(),
          () {
            snackBar(
              context,
              contentText: "تم تعديل المنتج",
              seconds: 3,
              backgroundColor: AppColors.primaryColor,
              titleColor: AppColors.blackColor,
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomProgressIndecator(),
            SizedBox(height: 10),
            TitleTexts(text: "جاري تعديل المنتج"),
          ],
        ),
      ),
    );
  }
}
