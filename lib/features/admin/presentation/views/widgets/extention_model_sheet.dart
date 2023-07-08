import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/features/new_products/data/model/extention_model.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manger/admin_screen_cubit/admin_screen_cubit.dart';

class ExtentionDetailsModelSheet extends StatelessWidget {
  const ExtentionDetailsModelSheet({
    super.key,
    required this.extention,
  });

  final ExtentionModel extention;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminScreenCubit(),
      child: BlocConsumer<AdminScreenCubit, AdminScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: CustomSize().widthSize(context, 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TitleTexts(
                        text: "تفاصيل الاضافة",
                        fontFamily: AssetDate.messiriFont,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  TitleTexts(
                    text: "${extention.name}",
                    fontFamily: AssetDate.messiriFont,
                    fontSize: 36,
                  ),
                  SubTitleText(
                    text: "${extention.priceL} جنيه",
                    fontFamily: AssetDate.messiriFont,
                    fontSize: 28,
                    subTitleColor: AppColors.blackColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomButton(
                    buttonName: "تمام",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
