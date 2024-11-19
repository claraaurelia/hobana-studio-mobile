import 'package:flutter/material.dart';
import 'package:hobana_studio/models/product_entry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;  // Menerima data produk yang dipilih dari daftar

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name: ${product.fields.productName}",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Price: \$${product.fields.productPrice}",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8),
            Text(
              "Description: ${product.fields.productDescription}",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // Tombol untuk kembali ke halaman daftar produk
              },
              child: const Text('Back to Product List'),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
