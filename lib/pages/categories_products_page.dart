import 'package:flutter/material.dart';
import 'package:q_mart/models/product_model.dart';
import 'package:q_mart/widgets/products_gridview.dart';

class CategoriesProductsPage extends StatelessWidget {
  const CategoriesProductsPage({super.key, required this.text, required this.productsList});
  final String text;
  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ProductsGridView(
            list: productsList,
          ),
        ],
      ),
    );
  }
}
