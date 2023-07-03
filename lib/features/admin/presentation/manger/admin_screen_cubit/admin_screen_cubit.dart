import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constanent.dart';
import '../../../data/model/product_model.dart';

part 'admin_screen_state.dart';

class AdminScreenCubit extends Cubit<AdminScreenState> {
  AdminScreenCubit() : super(AdminScreenInitial());
  static AdminScreenCubit get(context) => BlocProvider.of(context);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection(Constant.productKey);

  void filterCategoty({required String category}) {
    emit(Loading());
    try {
      collection
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((querySnapshot) {
        final documents = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductModel.fromFirestore(data);
        }).toList();
        emit(Success(documents));
      });
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  void deleteDocument({required String documentId, required String category}) {
    try {
      emit(TryToDeleted());
      FirebaseFirestore.instance
          .collection(Constant.productKey)
          .doc(documentId)
          .delete();
      emit(DeletedSuccessfully());
      filterCategoty(category: category);
    } catch (e) {
      emit(DeletedFailed(e.toString()));
    }
  }
}
