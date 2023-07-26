import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../admin/data/model/product_model.dart';
import 'add_data_state.dart';

class AddDataCubit extends Cubit<AddDataState> {
  AddDataCubit() : super(AdminInitial());

  static AddDataCubit get(context) => BlocProvider.of(context);

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

  final CollectionReference collection =
      FirebaseFirestore.instance.collection(Constant.productKey);
  void addDocument(ProductModel product) {
    try {
      emit(LoadindSendData());

      final docRef = collection.doc(product.id);
      docRef.set(product.toFirestore());

      emit(SuccessSendData());
    } catch (e) {
      emit(FaulierSendDAta(e.toString()));
    }
  }
}
