class ExtentionModel {
  String? id;
  String? name;
  String? price;
  String? category;

  ExtentionModel({this.name, this.id, this.price, this.category});

  factory ExtentionModel.fromFirestore(Map<String, dynamic> data) {
    return ExtentionModel(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      category: data['category'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (price != null) "price": price,
      if (category != null) "category": category,
    };
  }
}
