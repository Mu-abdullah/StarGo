part of 'pre_order_cubit.dart';

abstract class PreOrderState extends Equatable {
  const PreOrderState();

  @override
  List<Object> get props => [];
}

class PrepaidOrderInitial extends PreOrderState {}

class LoadingAddOrder extends PreOrderState {}

class SuccessAddOrder extends PreOrderState {}

class FailureAddOrder extends PreOrderState {
  final String error;
  const FailureAddOrder(this.error);
}


class TryToDeleted extends PreOrderState {}

class DeletedSuccessfully extends PreOrderState {}

class DeletedFailed extends PreOrderState {
  final String error;
  const DeletedFailed(this.error);
}


class Success extends PreOrderState {}
class ClearListSuccess extends PreOrderState {}
