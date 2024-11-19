import 'package:flutter/material.dart';
import 'package:hobana_studio/models/product_entry.dart';
import 'package:hobana_studio/screens/product_detail.dart'; // Import halaman detail
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  // Fungsi untuk mengambil semua produk dari server
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/'); // Mendapatkan semua produk dari server
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        ProductEntry product = ProductEntry.fromJson(d);
        listProduct.add(product);  // Menambahkan produk ke dalam list
      }
    }
    return listProduct;  // Mengembalikan daftar semua produk
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      body: FutureBuilder(
        future: fetchProduct(request),  // Mengambil semua produk
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No products available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,  // Menampilkan produk
              itemBuilder: (_, index) {
                final product = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail produk saat item ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(product.fields.productName),
                      subtitle: Text(
                        'Price: \$${product.fields.productPrice}\nDescription: ${product.fields.productDescription}',
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
