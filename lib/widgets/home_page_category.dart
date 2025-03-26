// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:q_mart/models/category_model.dart';
import 'package:q_mart/models/product_model.dart';
import 'package:q_mart/pages/categories_products_page.dart';
import 'package:q_mart/services/database_service.dart';
//comment test
class HomePageCategory extends StatelessWidget {
  const HomePageCategory({
    super.key,
    required this.cat1,
    required this.cat2,
  });
  final CategoryModel cat1, cat2;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(
        2,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () async {
              List<ProductModel> productsList =
                  await DataBaseService.fetchCategoryProducts(
                      index == 0 ? cat1.id : cat2.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesProductsPage(
                    text: index == 0 ? cat1.categoryName : cat2.categoryName,
                    productsList: productsList,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              alignment: Alignment.center,
              child: Text(index == 0 ? cat1.categoryName : cat2.categoryName),
            ),
          ),
        ),
      ),
    );
  }
}
