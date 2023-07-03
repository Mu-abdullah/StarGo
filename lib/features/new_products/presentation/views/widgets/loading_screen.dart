import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_snack_bar.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/widgets/custom_circle_progress.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        GoRouter.of(context).pop(AppRouter.homeScreen);
        Future.delayed(
          const Duration(),
          () {
            snackBar(
              context,
              contentText: "تم رفع المنتج",
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
            TitleTexts(text: "جاري رفع المنتج"),
          ],
        ),
      ),
    );
  }
}
