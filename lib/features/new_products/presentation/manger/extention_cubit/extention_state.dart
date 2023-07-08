part of 'extention_cubit.dart';

abstract class ExtentionState extends Equatable {
  const ExtentionState();

  @override
  List<Object> get props => [];
}

class ExtentionInitial extends ExtentionState {}

class LoadingSendData extends ExtentionState {}

class SuccessSendData extends ExtentionState {}

class FaulierSendData extends ExtentionState {
  final String error;
  const FaulierSendData(this.error);
}

class Loading extends ExtentionState {}

class Success extends ExtentionState {
  final List<ExtentionModel> allProducts;
  const Success(this.allProducts);
}

class Failure extends ExtentionState {
  final String errMsg;
  const Failure(this.errMsg);
}

class TryToDeleted extends ExtentionState {}

class DeletedSuccessfully extends ExtentionState {}

class Canceled extends ExtentionState {}

class DeletedFailed extends ExtentionState {
  final String erroMsg;
  const DeletedFailed(this.erroMsg);
}
