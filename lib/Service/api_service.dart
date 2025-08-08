import 'dart:convert';
import 'package:api_practice/models/product_model.dart';
import 'package:http/http.dart';

class ApiService{
  static Future <List<ProductModel>?> getProduct() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await get(url);

    if (response.statusCode == 200) {
      print('Success');
      final List<dynamic> jsonProduct = jsonDecode(response.body);
      return jsonProduct.map((product) => ProductModel.fromJson(product)).toList();

    } else {
      print('Failed');
      return null;
    }
  }//API integrate function..



}