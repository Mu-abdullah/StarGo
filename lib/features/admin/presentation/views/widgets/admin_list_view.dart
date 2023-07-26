import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:seller/core/widgets/custom_snack_bar.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/error_get_data.dart';
import '../../manger/admin_screen_cubit/admin_screen_cubit.dart';
import 'admin_view_item.dart';

class AdminGridViewItems extends StatefulWidget {
  const AdminGridViewItems({
    super.key,
  });

  @override
  State<AdminGridViewItems> createState() => _AdminGridViewItemsState();
}

class _AdminGridViewItemsState extends State<AdminGridViewItems> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminScreenCubit, AdminScreenState>(
      listener: (context, state) {
        if (state is DeletedSuccessfully) {
          snackBar(context, contentText: "تم الحذف", seconds: 5);
        }
      },
      builder: (context, state) {
        if (state is Success) {
          return Expanded(
            child: state.allProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TitleTexts(
                          text: "لا يوجد اصناف هنا",
                          fontFamily: AssetDate.messiriFont,
                        ),
                        TitleTexts(
                          text: "اضغط على زر الاضافة",
                          fontFamily: AssetDate.messiriFont,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: state.allProducts.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final products = state.allProducts[index];
                      return AdminViewItem(products: products);
                    },
                  ),
          );
        } else if (state is Loading) {
          return SizedBox(
            height: CustomSize().heightSize(context, .6),
            child: Lottie.asset(
              'assets/animation_json/loading.json',
            ),
          );
        } else {
          return const ErrorGetData();
        }
      },
    );
  }
}
