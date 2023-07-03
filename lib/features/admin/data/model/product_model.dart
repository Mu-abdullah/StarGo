class ProductModel {
  String? id;
  String? category;
  String? image;
  String? adminMail;
  String? name;
  String? description;
  dynamic priceS;
  dynamic priceM;
  dynamic priceL;

  ProductModel({
    this.name,
    this.id,
    this.adminMail,
    this.priceS,
    this.priceM,
    this.priceL,
    this.description,
    this.category,
    this.image,
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> data) {
    return ProductModel(
      category: data['category'],
      id: data['id'],
      adminMail: data['adminToken'],
      name: data['name'],
      description: data['description'],
      priceL: data['priceL'],
      priceM: data['priceM'],
      priceS: data['priceS'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (adminMail != null) "adminToken": adminMail,
      if (priceS != null) "priceS": priceS,
      if (priceM != null) "priceM": priceM,
      if (priceL != null) "priceL": priceL,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (image != null) "image": image,
    };
  }
}
