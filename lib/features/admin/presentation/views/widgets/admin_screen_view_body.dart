import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seller/core/utils/constanent.dart';
import 'package:seller/core/utils/size.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';

class AdminScreenViewBody extends StatelessWidget {
  const AdminScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TitleTexts(
                        fontSize: 36,
                        text: AssetDate.appName,
                        fontFamily: AssetDate.righteousFont,
                        titleColor: AppColors.primaryColor,
                      ),
                      TitleTexts(
                        fontSize: 36,
                        text: "قائمة الاصناف",
                        titleColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  Image.asset(
                    AssetDate.logo,
                    height: CustomSize().heightSize(context, .15),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.pizzaCategory,
              );
            },
            title: const TitleTexts(text: "بيتزا"),
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
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.cripeCategory,
              );
            },
            title: const TitleTexts(text: "كريب"),
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
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.pastaCategory,
              );
            },
            title: const TitleTexts(text: "مكرونات"),
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
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.sweetPanCakeCategory,
              );
            },
            title: const TitleTexts(text: "فطائر حلو"),
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
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.saltyPanCakeCategory,
              );
            },
            title: const TitleTexts(text: "فطائر حادق"),
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
              GoRouter.of(context).push(
                AppRouter.categoryScreen,
                extra: Constant.zalapiaCategory,
              );
            },
            title: const TitleTexts(text: "زلابيا"),
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
              GoRouter.of(context).push(AppRouter.showExtentionsScreen);
            },
            title: const TitleTexts(text: "الاضافات"),
            leading: const Icon(
              Iconsax.receipt_add,
              color: AppColors.blackColor,
            ),
            trailing: const Icon(
              Iconsax.arrow_left_1,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
