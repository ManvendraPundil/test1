// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:q_mart/models/category_model.dart';
import 'package:q_mart/models/product_model.dart';
import 'package:q_mart/pages/categories_products_page.dart';
import 'package:q_mart/services/database_service.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> categories =  [
    
  ];
  @override
  void initState() {
    super.initState();
    initMethod();
  }

  initMethod() async {
    var list = await DataBaseService.fetchCategory();
    setState(() {
      categories = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              var category = categories[index];
              return GestureDetector(
                onTap: () async {
                  List<ProductModel> productsList =
                      await DataBaseService.fetchCategoryProducts(category.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesProductsPage(
                        text: category.categoryName,
                        productsList: productsList,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    category.categoryName,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
