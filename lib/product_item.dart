import 'dart:convert';

import 'package:api_practice/Add_new_product.dart';
import 'package:api_practice/Urls/urls.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool itemIsLoading = false;
  List<dynamic> product = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Products Item ${product.length}',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Visibility(
        visible: itemIsLoading == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: GridView.builder(
            itemCount: product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                childAspectRatio: 0.60,
                crossAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final item = product[index];
              return Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    // 👈 Child যতটুকু লাগে ততটুকু height নিবে
                    children: [
                      // Image Responsive
                      Flexible(
                        child: Image.network(
                          item['Img'],
                          fit: BoxFit.fill, // 👈 Image size auto adjust হবে
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Product Name
                      Text(
                        item['ProductName'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 5),

                      // Example another text
                      Text(
                        '৳ ${item['TotalPrice']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),

                      // Button Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddNewProduct()));
                            },
                            icon: const Icon(Icons.edit, color: Colors.green),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewProduct()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<List<ProductModel>?> fetchProducts() async {
    final url = Uri.parse(Urls.readProductUrl);
    final response = await get(url);

    if (response.statusCode == 200) {
      itemIsLoading = true;
      setState(() {});
      print('Success');
      print(response.body.runtimeType);
      final jsonProduct = jsonDecode(response.body);
      print(jsonProduct.runtimeType);

      final productList = jsonProduct['data'] as List;
      print(productList.length);
      // ProductModel jsonProduct =ProductModel.fromJson(data);
      product = productList;
      itemIsLoading = false;
      setState(() {});

      // return jsonProduct.map((product)=>ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
