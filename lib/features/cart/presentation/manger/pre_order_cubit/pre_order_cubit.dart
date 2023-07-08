import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../data/model/user_model/user_model.dart';
part 'pre_order_state.dart';

class PreOrderCubit extends Cubit<PreOrderState> {
  PreOrderCubit() : super(PrepaidOrderInitial());

  static PreOrderCubit get(context) => BlocProvider.of(context);

  preOrder(context, UserModel user) async {
    emit(LoadingAddOrder());
    try {
      var notesBox = Hive.box<UserModel>(AssetDate.kUserBox);

      await notesBox.add(user);
      emit(SuccessAddOrder());
      Navigator.pop(context);
    } catch (e) {
      emit(FailureAddOrder(e.toString()));
    }
  }

  void deleteDocument({required String documentId}) {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        try {
          await FirebaseFirestore.instance
              .collection(Constant.ordersKey)
              .doc(documentId)
              .delete();
          emit(DeletedSuccessfully());
        } catch (e) {
          emit(DeletedFailed(e.toString()));
        }
      },
    );
  }

  List<UserModel> user = [];
  var userBox = Hive.box<UserModel>(AssetDate.kUserBox);
  fetchAllPrePareOrder() {
    user = userBox.values.toList();
    emit(Success());
  }

  clearList() {
    userBox.clear();
    emit(ClearListSuccess());
  }

  double total() {
    double totalPrice = user.fold(
        0, (previousValue, element) => previousValue + (element.totalPrice));

    return totalPrice;
  }

  int quntity() {
    int quntity = user.fold(
        0, (previousValue, element) => previousValue + (element.quantity));

    return quntity;
  }
}
