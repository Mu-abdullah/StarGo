import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seller/features/cart/data/model/user_model/user_model.dart';

import '../../../../../core/utils/constanent.dart';

part 'order_screen_state.dart';

class OrderScreenCubit extends Cubit<OrderScreenState> {
  OrderScreenCubit() : super(OrderScreenInitial());
  static OrderScreenCubit get(context) => BlocProvider.of(context);

  void fetchDocuments() {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection(Constant.ordersKey);
    emit(Loading());
    try {
      collection.snapshots().listen((querySnapshot) {
        final documents = querySnapshot.docs.map((e) {
          final data = e.data() as Map<String, dynamic>;
          return UserModel.fromFirestore(data);
        }).toList();
        emit(Success(documents));
      });
    } catch (e) {
      emit(Failuer(e.toString()));
    }
  }
}
