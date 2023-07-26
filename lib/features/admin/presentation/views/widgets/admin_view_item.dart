import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/widgets/custom_button.dart';
import 'package:seller/features/admin/presentation/manger/admin_screen_cubit/admin_screen_cubit.dart';

import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../new_products/data/model/extention_model.dart';
import '../../../data/model/product_model.dart';
import 'admin_bottom_sheet_view.dart';

class AdminViewItem extends StatelessWidget {
  AdminViewItem({
    super.key,
    required this.products,
  });

  final ProductModel products;

  final ExtentionModel extentionModel = ExtentionModel();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: AppColors.primaryColor.withOpacity(.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: TitleTexts(
                  text: products.name!,
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomButton(
                  onPress: () {
                    BlocProvider.of<AdminScreenCubit>(context).deleteDocument(
                      collectionName:
                          products.category == Constant.extentionsKey
                              ? Constant.extentionsKey
                              : Constant.productKey,
                      documentId: products.id!,
                      category: products.category!,
                    );
                  },
                  buttonName: "حــذف",
                  fontsize: 14,
                  backgroungColor: AppColors.secondColor.withOpacity(.8),
                  titleColor: AppColors.whiteColor,
                ),
              )
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SubTitleText(
                  subTitleColor: AppColors.blackColor,
                  text: products.priceS == 0
                      ? ""
                      : "ص :${(products.priceS).round()} ج",
                ),
              ),
              Expanded(
                child: SubTitleText(
                  subTitleColor: AppColors.blackColor,
                  text: products.priceM == 0
                      ? ""
                      : "و :${(products.priceM).round()} ج",
                ),
              ),
              Expanded(
                child: SubTitleText(
                  subTitleColor: AppColors.blackColor,
                  text: products.priceL == 0
                      ? ""
                      : "ك :${(products.priceL).round()} ج",
                ),
              ),
            ],
          ),
          onTap: () {
            showMaterialModalBottomSheet(
                context: context,
                expand: false,
                enableDrag: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: ((context) {
                  return AdminProductDetailsView(
                    product: products,
                  );
                }));
          },
        ),
      ),
    );
  }
}
