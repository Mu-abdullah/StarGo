import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seller/core/utils/constanent.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_circle_progress.dart';
import 'package:seller/features/new_products/data/model/extention_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/widgets/error_get_data.dart';
import '../../../../new_products/presentation/manger/extention_cubit/extention_cubit.dart';
import 'extention_model_sheet.dart';

class ShowExtintionScreen extends StatefulWidget {
  const ShowExtintionScreen({super.key});

  @override
  State<ShowExtintionScreen> createState() => _ShowExtintionScreenState();
}

class _ShowExtintionScreenState extends State<ShowExtintionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExtentionCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: CustomSize().heightSize(context, .08),
                  width: CustomSize().widthSize(context, 1),
                  decoration: const BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleTexts(
                      text: "الاضافات",
                      titleColor: AppColors.whiteColor,
                      fontSize: 28,
                    ),
                  ),
                ),
                const ExtentionsListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExtentionsListView extends StatefulWidget {
  const ExtentionsListView({
    super.key,
  });

  @override
  State<ExtentionsListView> createState() => _ExtentionsListViewState();
}

class _ExtentionsListViewState extends State<ExtentionsListView> {
  @override
  void initState() {
    BlocProvider.of<ExtentionCubit>(context)
        .filterCategoty(category: Constant.extentionsKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExtentionCubit, ExtentionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Success) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.allProducts.length,
              itemBuilder: (context, index) {
                final extention = state.allProducts;
                return ExtentionListViewItem(
                  extenion: extention[index],
                );
              },
            ),
          );
        } else if (state is Loading) {
          return Column(
            children: const [CustomProgressIndecator()],
          );
        } else {
          return const ErrorGetData();
        }
      },
    );
  }
}

class ExtentionListViewItem extends StatelessWidget {
  const ExtentionListViewItem({
    super.key,
    required this.extenion,
  });
  final ExtentionModel extenion;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TitleTexts(text: "${extenion.name}"),
      subtitle: SubTitleText(
        text: "${extenion.price} جنيه",
        subTitleColor: AppColors.blackColor,
      ),
      trailing: TextButton(
        onPressed: () {
          BlocProvider.of<ExtentionCubit>(context).deleteDocument(
            documentId: extenion.id!,
            category: Constant.extentionsKey,
          );
        },
        child: const TitleTexts(
          text: "حذف",
          titleColor: AppColors.secondColor,
        ),
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
              return ExtentionDetailsModelSheet(
                extention: extenion,
              );
            }));
      },
    );
  }
}
