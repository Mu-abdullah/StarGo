import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/category_image.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/product_model.dart';
import '../../manger/admin_screen_cubit/admin_screen_cubit.dart';

class AdminProductDetailsView extends StatelessWidget {
  const AdminProductDetailsView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminScreenCubit(),
      child: BlocConsumer<AdminScreenCubit, AdminScreenState>(
        listener: (context, state) {
         
        },
        builder: (context, state) {

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                      clipper: BlobClipper(
                        id: '20-7-784150',
                      ),
                      child: CustomCategoryImage(product: product),
                    ),
                    Divider(
                      color: AppColors.blackColor,
                      thickness: CustomSize().widthSize(context, .01),
                      indent: CustomSize().widthSize(context, .35),
                    ),
                    TitleTexts(
                      text: product.name!,
                      fontFamily: AssetDate.messiriFont,
                      fontSize: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SubTitleText(
                            text: "صغير : ${product.priceS} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blueColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: SubTitleText(
                            text: "وسط : ${(product.priceM)} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blueColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: SubTitleText(
                            text: "كبير : ${product.priceL} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blueColor,
                          ),
                        ),
                      ],
                    ),
                    SubTitleText(
                      text: product.description!,
                      fontSize: 32,
                      fontFamily: AssetDate.messiriFont,
                      maxLines: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            buttonName: "تعديل الصنف",
                            onPress: () {
                              GoRouter.of(context).pushReplacement(
                                  AppRouter.editScreen,
                                  extra: product);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
