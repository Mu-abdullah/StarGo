import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../order_model/order_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject with EquatableMixin {
  final String? id;
  @HiveField(0)
  final String? userName;
  @HiveField(1)
  final String? userphone;
  @HiveField(2)
  final String? userAdress;
  @HiveField(3)
  final Timestamp? timeOfOrder;
  @HiveField(4)
  final List<OrderModel>? orders;

  UserModel({
    this.id,
    this.userName,
    this.userphone,
    this.userAdress,
    this.timeOfOrder,
    this.orders,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String?,
        userName: json['userName'] as String?,
        userphone: json['userphone'] as String?,
        userAdress: json['userAdress'] as String?,
        timeOfOrder: json['timeOfOrder'] as Timestamp?,
        orders: (json['orders'] as List<dynamic>?)
            ?.map((e) => OrderModel.fromFirestore(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toFirestore() => {
        'id': id,
        'userName': userName,
        'userphone': userphone,
        'userAdress': userAdress,
        'timeOfOrder': timeOfOrder,
        'orders': orders?.map((e) => e.toFirestore()).toList(),
      };

  @override
  List<Object?> get props => [id, userName, userphone, userAdress, orders];

  double get totalPrice {
    return orders?.fold<double>(
          0.0,
          (previousValue, order) =>
              previousValue + (order.price ?? 0.0) * (order.quantity ?? 0),
        ) ??
        0.0;
  }

  int get quantity {
    return orders?.fold<int>(
          0,
          (previousValue, order) => previousValue + (order.quantity ?? 0) + (0),
        ) ??
        0;
  }
}
