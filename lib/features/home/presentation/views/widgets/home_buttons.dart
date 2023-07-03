import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/utils/app_routs.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/texts.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            GoRouter.of(context).push(AppRouter.newProductScreen);
          },
          title: const TitleTexts(text: "اضافة صنف جديد"),
          leading: const Icon(
            Iconsax.additem,
            color: AppColors.blackColor,
          ),
          trailing: const Icon(
            Iconsax.arrow_left_1,
            color: AppColors.blackColor,
          ),
        ),
        ListTile(
          onTap: () {
            GoRouter.of(context).push(AppRouter.adminScreen);
          },
          title: const TitleTexts(text: "القائمة"),
          leading: const Icon(
            Iconsax.menu_board,
            color: AppColors.blackColor,
          ),
          trailing: const Icon(
            Iconsax.arrow_left_1,
            color: AppColors.blackColor,
          ),
        ),
        ListTile(
          onTap: () {
            GoRouter.of(context).push(AppRouter.orderScreen);
          },
          title: const TitleTexts(text: "الطلبات"),
          leading: const Icon(
            Iconsax.shopping_cart,
            color: AppColors.blackColor,
          ),
          trailing: const Icon(
            Iconsax.arrow_left_1,
            color: AppColors.blackColor,
          ),
        ),
        ListTile(
          onTap: () {
            GoRouter.of(context).push(AppRouter.prepareOrderScreen);
          },
          title: const TitleTexts(text: "الطلبات السابقة"),
          leading: const Icon(
            Icons.history,
            color: AppColors.blackColor,
          ),
          trailing: const Icon(
            Iconsax.arrow_left_1,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
