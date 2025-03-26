class ProductModel {
  String id;
  String categoryId;
  String name;
  String image;
  double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'price': price,
      'categoryId': categoryId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? "",
      name: map['name'],
      categoryId: map['categoryId'].toString(),
      image: map['image'],
      price: map['price'].toDouble(),
    );
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? categoryId,
    String? image,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}
