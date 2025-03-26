import 'package:flutter/material.dart';
import 'package:q_mart/models/product_model.dart';
import 'package:q_mart/pages/product_page.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.list,
  });
  final List<ProductModel> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        var product = list[index];
        return ProductCard(product: product);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Column(
          spacing: 4,
          children: [
            Expanded(
              child: Image.network(
                product.image,
              ),
            ),
            Text(product.name),
            Text("₹${product.price}"),
            MaterialButton(
              minWidth: double.infinity,
              onPressed: () {},
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}
