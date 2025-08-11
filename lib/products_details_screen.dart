import 'package:api_practice/Service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final String postId;

  ProductsDetailsScreen({
    super.key,
    required this.postId,
  });

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  bool isDetailsScreenInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: ApiService.getSinglePost(widget.postId),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final product = snapshot.data!;
              return Visibility(
                visible: isDetailsScreenInProgress == false,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(product.image)),
                      Text(
                        product.title,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rating:${product.ratingModel.rate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Count:${product.ratingModel.count}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
//ajke ei porjonto : 11--08--2025 Night 11:42 Allah Hafeez
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
