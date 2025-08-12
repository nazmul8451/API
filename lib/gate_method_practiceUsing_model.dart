import 'dart:convert';

import 'package:api_practice/Service/api_service.dart';
import 'package:api_practice/Widgets/Product_Card.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:api_practice/new_productCreate_screen.dart';
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

  void ProductCreate() {
    TextEditingController productTitleController = TextEditingController();
    TextEditingController productDescriptionController =
        TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Create New Product'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: productTitleController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Product title',
                      prefixIcon: const Icon(
                        Icons.title,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: productDescriptionController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Product description',
                      prefixIcon: const Icon(
                        Icons.description,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: productTotalPriceController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Product price',
                      prefixIcon: const Icon(
                        Icons.money,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: productQTYController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Product qty',
                      prefixIcon: const Icon(
                        Icons.event_available,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Cancel')),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white54),
                          onPressed: () {},
                          child: Text('Save')),
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('API Practice'),
      ),
      backgroundColor: Colors.white,
      body: product_card(
        onEdit:()=>ProductCreate(),
        onDelete: (){},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () => ProductCreate(),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}


