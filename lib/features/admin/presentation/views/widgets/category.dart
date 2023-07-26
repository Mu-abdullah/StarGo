import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/core/utils/constanent.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../manger/admin_screen_cubit/admin_screen_cubit.dart';
import 'admin_list_view.dart';

class CategortScreen extends StatefulWidget {
  const CategortScreen({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  State<CategortScreen> createState() => _CategortScreenState();
}

class _CategortScreenState extends State<CategortScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminScreenCubit>(context).filterCategoty(
      category: widget.categoryName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                width: CustomSize().widthSize(context, 1),
                decoration: const BoxDecoration(
                  color: AppColors.blueBlackColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: customName(),
                )),
            const AdminGridViewItems()
          ],
        ),
      ),
    );
  }

  TitleTexts customName() {
    return TitleTexts(
        titleColor: AppColors.whiteColor,
        fontSize: 28,
        text:
            "اصناف ال${widget.categoryName == Constant.pastaCategory ? "مكرونات" : widget.categoryName == Constant.cripeCategory ? "كريب" : widget.categoryName == Constant.zalapiaCategory ? "زلابيا" : widget.categoryName == Constant.pizzaCategory ? "بيتزا" : widget.categoryName == Constant.saltyPanCakeCategory ? "فطير الحادق" : widget.categoryName == Constant.sweetPanCakeCategory ? "فطير الحلو" : widget.categoryName == Constant.extentionsKey ? "اضافات" : ""}");
  }
}
