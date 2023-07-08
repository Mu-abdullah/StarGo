import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seller/features/admin/data/model/product_model.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/texts.dart';

part 'edit_screen_state.dart';

class EditScreenCubit extends Cubit<EditScreenState> {
  EditScreenCubit() : super(EditScreenInitial());

  static EditScreenCubit get(context) => BlocProvider.of(context);

  String? selectedValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: Constant.pizzaCategory,
          child: const SubTitleText(
            text: "بيتزا",
            fontFamily: AssetDate.messiriFont,
          )),
      DropdownMenuItem(
          value: Constant.pastaCategory,
          child: const SubTitleText(
            text: "مكرونات",
            fontFamily: AssetDate.messiriFont,
          )),
      DropdownMenuItem(
          value: Constant.sweetPanCakeCategory,
          child: const SubTitleText(
            text: "فطائر حلو",
            fontFamily: AssetDate.messiriFont,
          )),
      DropdownMenuItem(
          value: Constant.saltyPanCakeCategory,
          child: const SubTitleText(
            text: "فطائر حادق",
            fontFamily: AssetDate.messiriFont,
          )),
      DropdownMenuItem(
          value: Constant.cripeCategory,
          child: const SubTitleText(
            text: "كريب",
            fontFamily: AssetDate.messiriFont,
          )),
      DropdownMenuItem(
          value: Constant.zalapiaCategory,
          child: const SubTitleText(
            text: "زلابيا",
            fontFamily: AssetDate.messiriFont,
          )),
    ];
    return menuItems;
  }

  void changeValue(String value) {
    selectedValue = value;
    emit(ChangeToggle());
  }

  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection(Constant.productKey);

  Future<void> updateProductField(context, ProductModel product) async {
    try {
      emit(LoadindEditData());
      DocumentReference docRef = FirebaseFirestore.instance
          .collection(Constant.productKey)
          .doc(product.id);
      await docRef.update(product.toFirestore());

      emit(SuccessEditData());
      GoRouter.of(context).replace(AppRouter.editLoadingScreen);
    } catch (e) {
      if (!isClosed) {
        emit(FaulierEditData(e.toString()));
      }
    }
  }
}
