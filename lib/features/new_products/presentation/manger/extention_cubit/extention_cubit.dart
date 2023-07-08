import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constanent.dart';
import '../../../data/model/extention_model.dart';

part 'extention_state.dart';

class ExtentionCubit extends Cubit<ExtentionState> {
  ExtentionCubit() : super(ExtentionInitial());

  static ExtentionCubit get(context) => BlocProvider.of(context);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection(Constant.extentionsKey);
  void sendExtention(ExtentionModel extention) {
    try {
      emit(LoadingSendData());

      final docRef = collection.doc(extention.id);
      docRef.set(extention.toFirestore());

      emit(SuccessSendData());
    } catch (e) {
      emit(FaulierSendData(e.toString()));
    }
  }


  void filterCategoty(
      { required String category}) {
    emit(Loading());
    try {
      collection
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((querySnapshot) {
        final documents = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ExtentionModel.fromFirestore(data);
        }).toList();
        emit(Success(documents));
      });
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  void deleteDocument({
   
    required String documentId,
    required String category,
  }) {
    try {
      emit(TryToDeleted());
      FirebaseFirestore.instance
          .collection(Constant.extentionsKey)
          .doc(documentId)
          .delete();
      emit(DeletedSuccessfully());
      filterCategoty(category: category);
    } catch (e) {
      emit(DeletedFailed(e.toString()));
    }
  }
}
