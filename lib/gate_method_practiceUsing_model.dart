import 'dart:convert';

import 'package:api_practice/Service/api_service.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:api_practice/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetMethod_UsingModel extends StatefulWidget {
  GetMethod_UsingModel({
    super.key,
  });

  @override
  State<GetMethod_UsingModel> createState() => _GetMethod_UsingModelState();
}

class _GetMethod_UsingModelState extends State<GetMethod_UsingModel> {
  bool isLoadingInProgress = false;

  List<ProductModel> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  //calling api with getProudct() function.......
  Future getProduct() async {
    isLoadingInProgress = true;
    setState(() {});
    final productData = await ApiService.getProduct();
    setState(() {
      productList = productData!;
    });
    isLoadingInProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Get method using model'),
      ),
      backgroundColor: Colors.white,
      body: Visibility(
        visible: isLoadingInProgress == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsDetailsScreen(
                              postId: product.id.toString())));
                },
                leading: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  product.title,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                subtitle: Text(
                  product.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                trailing: Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
