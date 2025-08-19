import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImg;
  final String productDescription;

  Custom_TextField({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImg,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1), // Shadow color
                spreadRadius: 2, // How much the shadow spreads
                blurRadius: 5, // Smoothness of the shadow
                offset: Offset(2, 2), // Position of the shadow
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "$productName",
              fillColor: Colors.white, // Background color
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ]
    );
  }
}
