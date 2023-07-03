part of 'order_screen_cubit.dart';

abstract class OrderScreenState extends Equatable {
  const OrderScreenState();

  @override
  List<Object> get props => [];
}

class OrderScreenInitial extends OrderScreenState {}

class Loading extends OrderScreenState {}

class Success extends OrderScreenState {
  final List<UserModel> allOrders;
  const Success(this.allOrders);
}

class Failuer extends OrderScreenState {
  final String errMsg;
  const Failuer(this.errMsg);
}
