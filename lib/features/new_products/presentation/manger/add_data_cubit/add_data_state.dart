abstract class AddDataState {}

class AdminInitial extends AddDataState {}

class IsDiscount extends AddDataState {}

class ChangeToggle extends AddDataState {}

class LoadindSendData extends AddDataState {}

class SuccessSendData extends AddDataState {}

class FaulierSendDAta extends AddDataState {
  final String errMessage;
  FaulierSendDAta(this.errMessage);
}
