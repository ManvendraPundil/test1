import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:q_mart/models/category_model.dart';
import 'package:q_mart/models/home_model.dart';
import 'package:q_mart/models/product_model.dart';

class DataBaseService {
  static Future<List<ProductModel>> fetchProducts() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    List<ProductModel> productsList = querySnapshot.docs
        .map(
          (e) => ProductModel.fromMap(e.data()).copyWith(id: e.id),
        )
        .toList();
    return productsList;
  }

  static Future<ProductModel> getProduct(String productId) async {
    var data = await FirebaseFirestore.instance
        .collection("products")
        .doc(productId)
        .get();
    return ProductModel.fromMap(data.data()!).copyWith(id: data.id);
  }

  static Future<CategoryModel> getCategory(String categoryId) async {
    var data = await FirebaseFirestore.instance
        .collection("categories")
        .doc(categoryId)
        .get();
    return CategoryModel.fromMap(data.data()!).copyWith(id: data.id);
  }

  static Future<List<CategoryModel>> fetchCategory() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection("categories").get();

    return querySnapshot.docs
        .map(
          (e) => CategoryModel.fromMap(e.data()).copyWith(id: e.id),
        )
        .toList();
  }

  static Future<HomeModel> fetchHome() async {
    var data = await FirebaseFirestore.instance
        .collection("appData")
        .doc("homePage")
        .get();
    log("1");
    var homeModel = HomeModel.fromMap(data.data()!);
    log("2");
    List<ProductModel> productList = await Future.wait(
      homeModel.homeList.map((e) => getProduct(e)),
    );
    log("3");
    List<CategoryModel> categories = await Future.wait(
      homeModel.categoriesList.map((e) => getCategory(e)),
    );
    log("4");
    return homeModel.copyWith(
      productsList: productList,
      categories: categories,
    );
  }

  static Future<List<ProductModel>> fetchCategoryProducts(
      String categoryId) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('categoryId', isEqualTo: int.parse(categoryId))
        .get();
    log(querySnapshot.docs.toString());

    return querySnapshot.docs
        .map((doc) => ProductModel.fromMap(doc.data()).copyWith(id: doc.id))
        .toList();
  }

  static addProducts() async {
    var list = [
      {
        "name": "Kurkure",
        "price": 20,
        "image":
            "https://wholesalemeans.com/image/cache/catalog/product/Snacks/Kurkure%20Masala%20Munch%2075%20G%20Front%20Pic-700x800.png",
        "categoryId": 4
      },
      {
        "name": "Pringles",
        "price": 90,
        "image":
            "https://www.pngplay.com/wp-content/uploads/15/Pringles-Crisps-PNG-HD-Quality.png",
        "categoryId": 4
      },
      {
        "name": "Hide&Seek Biscuits",
        "price": 40,
        "image":
            "https://www.deligos.com/assets/uploads/1643204475_d0096983616bf728d5bb.png",
        "categoryId": 4
      },
      {
        "name": "CocaCola",
        "price": 50,
        "image":
            "https://www.freeiconspng.com/uploads/bottle-coca-cola-png-transparent-2.png",
        "categoryId": 4
      },
      {
        "name": "Fanta",
        "price": 40,
        "image": "https://pngimg.com/d/fanta_PNG46.png",
        "categoryId": 4
      },
      {
        "name": "Aloo Bhujia",
        "price": 30,
        "image":
            "https://www.haldiram.com/media/catalog/product/f/0/f007604000391_2.png?auto=webp&format=png&width=1000&height=1000&fit=cover",
        "categoryId": 4
      },
      {
        "name": "Haldiram Namkeen",
        "price": 20,
        "image":
            "https://www.haldiram.com/media/catalog/product/1/_/1_160.png?optimize=medium&fit=cover&height=375&width=840&auto=webp&format=png",
        "categoryId": 4
      },
      {
        "name": "Lays Chips",
        "price": 20,
        "image":
            "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto/NI_CATALOG/IMAGES/CIW/2024/8/1/2f9d6d96-f2a5-4105-8ba6-d62ea2139213_5445_1.png",
        "categoryId": 4
      }
    ];
    for (var element in list) {
      await FirebaseFirestore.instance.collection("products").add(element);
    }
  }
}
