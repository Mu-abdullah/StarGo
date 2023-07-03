import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class OrderModel extends Equatable {
  @HiveField(0)
  final String? pName;
  @HiveField(1)
  final int? quantity;
  @HiveField(2)
  final String? size;
  @HiveField(3)
  final String? note;
  @HiveField(4)
  final double? price;
  @HiveField(6)
  double? totalPrice;
  @HiveField(7)
  final String? time;
  @HiveField(8)
  final String? category;

  OrderModel({
    this.pName,
    this.quantity,
    this.size,
    this.note,
    this.price,
    this.time,
    this.category,
  }) {
    getTotalPrice();
  }
  factory OrderModel.fromFirestore(Map<String, dynamic> json) => OrderModel(
        pName: json['name'] as String?,
        quantity: json['quantity'] as int?,
        size: json['size'] as String?,
        note: json['note'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        time: json['time'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toFirestore() => {
        'name': pName,
        'quantinty': quantity,
        'size': size,
        'note': note,
        'price': price,
        'time': time,
        'category': category,
      };

  @override
  List<Object?> get props {
    return [
      pName,
      quantity,
      size,
      note,
      price,
      time,
      category,
    ];
  }

  double getTotalPrice() {
    if (quantity != null && price != null) {
      return quantity! * price!;
    } else {
      return 0.0;
    }
  }
}
