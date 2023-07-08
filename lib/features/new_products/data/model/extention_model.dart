class ExtentionModel {
  String? id;
  String? name;
  String? priceL;
  String? category;

  ExtentionModel({this.name, this.id, this.priceL, this.category});

  factory ExtentionModel.fromFirestore(Map<String, dynamic> data) {
    return ExtentionModel(
      id: data['id'],
      name: data['name'],
      priceL: data['priceL'],
      category: data['category'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (priceL != null) "priceL": priceL,
      if (category != null) "category": category,
    };
  }
}
