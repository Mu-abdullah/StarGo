part of 'admin_screen_cubit.dart';

abstract class AdminScreenState extends Equatable {
  const AdminScreenState();

  @override
  List<Object> get props => [];
}

class AdminScreenInitial extends AdminScreenState {}

class Loading extends AdminScreenState {}

class Success extends AdminScreenState {
  final List<ProductModel> allProducts;
  const Success(this.allProducts);
}

class Failure extends AdminScreenState {
  final String errMsg;
  const Failure(this.errMsg);
}
class TryToDeleted extends AdminScreenState {}

class DeletedSuccessfully extends AdminScreenState {}

class Canceled extends AdminScreenState {}

class DeletedFailed extends AdminScreenState {
  final String erroMsg;
  const DeletedFailed(this.erroMsg);
}