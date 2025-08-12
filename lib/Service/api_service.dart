import 'dart:convert';
import 'package:api_practice/Urls/urls.dart';
import 'package:api_practice/models/porduct_details_model.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ApiService {


  ///that is all post get api link/
  ///kivabe sob post get method use kore api te show kora jay seta...
  // static Future<List<ProductModel>?> getProduct() async {
  //   final url = Uri.parse(Urls.baseUrl);
  //   final response = await get(url);
  //
  //   if (response.statusCode == 200) {
  //     print('Success');
  //     final List<dynamic> jsonProduct = jsonDecode(response.body);
  //     return jsonProduct
  //         .map((product) => ProductModel.fromJson(product))
  //         .toList();
  //   } else {
  //     print('Failed');
  //     return null;
  //   }
  // } //API integrate function..

//that is single post access function
//   static Future<ProductDetailsModel?> getSinglePost(String id) async {
//     final url = Uri.parse('${Urls.createPost}/$id');
//     final response = await get(url);
//
//     // যদি আমরা সাকসেসফুলই এপি আই থেকে রেসপন্স পেয়ে যাই তাহলে নিচের এই লজিক টা কাজ করবে
//     if (response.statusCode == 200) {
//       final decodedData = jsonDecode(response.body);
//       return ProductDetailsModel.fromJson(decodedData);
//     } else {
//       debugPrint('Something Error');
//     }
//   }

  ///single post access korar api request

  // static Future createPost( String title,String description) async {
  //   final url = Uri.parse(Urls.createPost);
  //   final response = await post(
  //       url,
  //       body: {
  //         "title": 'Hello Title',
  //         "price": 29.99.toString(),
  //         "description": 'description',
  //         "image": "https://i.pravatar.cc",
  //         "category": "electronics"
  //       } ,
  //       headers:{
  //         'conten-type' : 'application/json',
  //       },
  //   );
  //
  //   if(response.statusCode == 200 || response.statusCode == 201){
  //     print('Product Created Successful');
  //     print('Response : ${response.statusCode}');
  //
  //   }else
  //     {
  //       print('Product create failed');
  //     }
  //
  // }
}
