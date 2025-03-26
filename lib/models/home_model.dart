import 'package:q_mart/models/category_model.dart';
import 'package:q_mart/models/product_model.dart';

class HomeModel {
  String bannerImage;
  String homeListName;
  List<String> homeList;
  List<String> categoriesList;
  List<CategoryModel> categories;
  List<ProductModel> productsList;

  HomeModel({
    required this.bannerImage,
    required this.homeListName,
    required this.homeList,
    required this.categoriesList,
    required this.productsList,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bannerImage': bannerImage,
      'homeListName': homeListName,
      'homeList': homeList,
      'categoriesList': categoriesList,
      'productsList': productsList,
      'categories': categories,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      bannerImage: map['bannerImage'],
      homeListName: map['homeListName'],
      homeList: List<String>.from((map['homeList'])),
      categoriesList: List<String>.from((map['categoriesList'])),
      productsList: map['productsList'] ?? [],
      categories: map['categories'] ?? [],
    );
  }

  HomeModel copyWith({
    String? bannerImage,
    String? homeListName,
    List<String>? homeList,
    List<String>? categoriesList,
    List<CategoryModel>? categories,
    List<ProductModel>? productsList,
  }) {
    return HomeModel(
      bannerImage: bannerImage ?? this.bannerImage,
      homeListName: homeListName ?? this.homeListName,
      homeList: homeList ?? this.homeList,
      categoriesList: categoriesList ?? this.categoriesList,
      categories: categories ?? this.categories,
      productsList: productsList ?? this.productsList,
    );
  }
}
