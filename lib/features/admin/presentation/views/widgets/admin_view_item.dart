import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seller/core/utils/colors.dart';

import '../../../../../core/utils/texts.dart';
import '../../../data/model/product_model.dart';
import '../../manger/admin_screen_cubit/admin_screen_cubit.dart';
import 'admin_bottom_sheet_view.dart';

class AdminViewItem extends StatelessWidget {
  const AdminViewItem({
    super.key,
    required this.products,
  });

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GestureDetector(
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
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AdminScreenCubit>(context)
                              .deleteDocument(
                            documentId: products.id!,
                            category: products.category!,
                          );
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.delete_forever,
                            color: AppColors.secondColor,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TitleTexts(text: products.name!),
                    ],
                  ),
                ),
              )),
        ));
  }
}
