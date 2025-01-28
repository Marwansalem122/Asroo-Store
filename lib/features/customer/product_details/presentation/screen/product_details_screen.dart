import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({required this.productId, super.key});
  int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: const Center(
        child: Text('Product Details Screen'),
      ),
    );
  }
}
