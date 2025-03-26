import 'package:flutter/material.dart';
import 'package:q_mart/models/product_model.dart';
import 'package:q_mart/pages/checkout_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Expanded(
              child: Image.network(
                product.image,
              ),
            ),
            Text(
              "₹${product.price}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            MaterialButton(
              onPressed: () {},
              height: 60,
              minWidth: double.infinity,
              color: Colors.blue,
              child: Text(
                "Add to cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      productsList: [product],
                    ),
                  ),
                );
              },
              height: 60,
              minWidth: double.infinity,
              shape: Border.all(color: Colors.blue),
              color: Colors.white,
              child: Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
