import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_circle_progress.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../data/model/user_model/user_model.dart';
import '../../manger/pre_order_cubit/pre_order_cubit.dart';

class LoadindDelete extends StatelessWidget {
  const LoadindDelete({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PreOrderCubit()..deleteDocument(documentId: user.id!),
      child: BlocConsumer<PreOrderCubit, PreOrderState>(
        listener: (context, state) {
          if (state is DeletedSuccessfully) {
            snackBar(
              context,
              contentText: "جاري تحضير الطلب\nلا تنسى متابعة الطلب",
              seconds: 3,
              backgroundColor: AppColors.primaryColor,
              titleColor: AppColors.blackColor,
            );
            GoRouter.of(context).pushReplacement(AppRouter.orderScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomProgressIndecator(),
                  SizedBox(height: 10),
                  TitleTexts(text: "جاري تحضير المنتج"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
