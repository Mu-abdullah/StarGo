import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:seller/core/utils/app_routs.dart';
import 'package:seller/core/utils/colors.dart';
import 'package:seller/core/utils/size.dart';
import 'package:seller/core/utils/texts.dart';
import 'package:seller/core/widgets/custom_button.dart';
import 'package:seller/features/cart/presentation/manger/pre_order_cubit/pre_order_cubit.dart';

import '../../../../../core/widgets/custom_divider.dart';
import '../../../data/model/user_model/user_model.dart';
import 'order_details_card.dart';

class ShowOrderBottomScreen extends StatelessWidget {
  const ShowOrderBottomScreen({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    Timestamp? timestamp = user.timeOfOrder;

    DateTime dateTime = timestamp?.toDate() ?? DateTime.now();

    String formattedTime = DateFormat('MM/d  ,   h:mm a').format(dateTime);
    return BlocProvider(
      create: (context) => PreOrderCubit(),
      child: BlocConsumer<PreOrderCubit, PreOrderState>(
        listener: (context, state) {
          if (state is SuccessAddOrder) {
            GoRouter.of(context)
                .push(AppRouter.loadingDeleteScreen, extra: user);
          }
        },
        builder: (context, state) {
          PreOrderCubit cubit = PreOrderCubit.get(context);
          return SafeArea(
              child: Scaffold(
            body: OrderDetails(
              user: user,
              formattedTime: formattedTime,
              cubit: cubit,
            ),
          ));
        },
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.user,
    required this.formattedTime,
    required this.cubit,
  });

  final UserModel user;
  final String formattedTime;
  final PreOrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleTexts(
            text: "بيانات الطلب",
            fontSize: 36,
          ),
          TitleTexts(text: "الاسم : ${user.userName!}"),
          TitleTexts(text: "الرقم : ${user.userphone!}"),
          TitleTexts(text: "العنوان : ${user.userAdress!}"),
          TitleTexts(text: "وقت الطلب : $formattedTime"),
          TitleTexts(
              text:
                  "المبلغ المطلوب : ${user.totalPrice.round().toString()} جنيه"),
          TitleTexts(text: "عدد الطلبات ( ${user.orders!.length.toString()} )"),
          CustomDivider(
            thickness: CustomSize().widthSize(context, .01),
            color: AppColors.primaryColor,
          ),
          OrderDetailsCard(
            user: user,
          ),
          CustomButton(
              onPress: () {
                final preOrder = UserModel(
                  userName: user.userName,
                  userphone: user.userphone,
                  userAdress: user.userAdress,
                  orders: user.orders,
                );
                cubit.preOrder(
                  context,
                  preOrder,
                );
              },
              buttonName: "تحضير الطلب")
        ],
      ),
    );
  }
}
