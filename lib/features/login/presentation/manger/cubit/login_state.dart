part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFaliuer extends LoginState {
  final String errMsg;
  const LoginFaliuer(this.errMsg);
}

class LoginLoading extends LoginState {}
