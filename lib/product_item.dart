import 'dart:convert';
import 'package:api_practice/Add_new_product.dart';
import 'package:api_practice/Urls/urls.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool itemIsLoading = false;
  List<dynamic> product = [];

  final _productNameController = TextEditingController();
  final _imgController = TextEditingController();
  final _qtyController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _totalPriceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchProducts();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _productNameController.dispose();
    _imgController.dispose();
    _qtyController.dispose();
    _unitPriceController.dispose();
    _totalPriceController.dispose();
    super.dispose();
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
                    children: [
                      // Image Responsive
                      Flexible(
                        child: Image.network(
                          item['Img'],
                          fit: BoxFit.fill,
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
                            onPressed: () async {
                              final productId = item['_id'];
                              bool isDeleted = await deleteProduct(productId);

                              if (isDeleted) {
                                print(isDeleted.runtimeType);
                                setState(() {
                                  product.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Product deleted successfully')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Failed to delete product')));
                              }
                            },
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
          showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: Text(
                    'Add Prodcut',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Form(
                      child: ListBody(
                        children: [
                          TextFormField(
                            controller: _productNameController,
                            decoration:
                                const InputDecoration(hintText: 'Product Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter product name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _imgController,
                            decoration:
                                const InputDecoration(hintText: 'Image URL'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Image URL';
                              } else if (!Uri.tryParse(value)!
                                      .hasAbsolutePath ??
                                  true) {
                                return 'Please enter a valid URL';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _qtyController,
                            decoration: const InputDecoration(
                                hintText: 'Product quantity'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter product quantity';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _unitPriceController,
                            decoration:
                                const InputDecoration(hintText: 'Unit Price'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter product Unit price';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _totalPriceController,
                            decoration:
                                const InputDecoration(hintText: 'Total Price'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter product Total price';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    ElevatedButton(
                        onPressed: (){
                          createProducts(
                              _productNameController.text,
                              _imgController.text,
                              int.parse(_unitPriceController.text.trim()),
                              int.parse(_totalPriceController.text.trim()),
                              _qtyController.text.trim());
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                        child: Text('Add',style: TextStyle(color: Colors.white),),

                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<bool> deleteProduct(String productId) async {
    final url = Uri.parse(Urls.deleteProductUrl(productId));
    final response = await get(url);

    if (response.statusCode == 200) {
      print("Deleted: $productId");
      return true;
    } else {
      print("Delete failed: ${response.body}");
      return false;
    }
  }

  Future<List<ProductModel>?> createProducts(String productName, String img,
      int unitPrice, int totalPrice, String qty) async {
    final url = Uri.parse(Urls.createProductUrl);
    final response = await post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": productName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": unitPrice,
        "TotalPrice": totalPrice,
      }),
    );
    if (response.statusCode == 201) {
      itemIsLoading = true;
      setState(() {});
      print('Success');
      fetchProducts();
      itemIsLoading = false;
      setState(() {});

      // return jsonProduct.map((product)=>ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductModel>?> fetchProducts() async {
    final url = Uri.parse(Urls.readProductUrl);
    final response = await get(url);

    if (response.statusCode == 200) {
      itemIsLoading = true;
      setState(() {});
      print('Success');
      final jsonProduct = jsonDecode(response.body);

      final productList = jsonProduct['data'] as List;
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
