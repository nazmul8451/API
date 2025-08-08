///this is basic model using get method date : 08-08-2025
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String,dynamic> jsonData){
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        price: jsonData['price'],
        image: jsonData['image'],
    );
  }


}