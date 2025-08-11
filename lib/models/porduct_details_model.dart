class ProductDetailsModel{
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel ratingModel;
  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.ratingModel,
  });

  factory ProductDetailsModel.fromJson(Map<String,dynamic> jsonData){
    return ProductDetailsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
      ratingModel: RatingModel.fromJson(jsonData['rating']),
    );
  }
}
//
class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
});

  factory RatingModel.fromJson(Map<String,dynamic> jsonData){
    return RatingModel(
     count: jsonData['count'],
     rate: jsonData['rate'],
    );
  }
}