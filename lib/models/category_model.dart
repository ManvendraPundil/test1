class CategoryModel {
  String categoryName;
  String id;
  
  CategoryModel({
    required this.categoryName,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': categoryName,
      'id': id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'],
      id: map['id'] ?? "",
    );
  }

  CategoryModel copyWith({
    String? categoryName,
    String? id,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
    );
  }
}
