class Urls {
  ///............
  // static const String baseUrl = 'http://35.73.30.144:2005/api/v1';
  // static const String  registrationUrl = '$baseUrl/Registration';
  //-------

  // static const String baseUrl = 'https://fakestoreapi.com/products';
  // static const String createPost = '$baseUrl';

  static String baseUrl = 'http://35.73.30.144:2008/api/v1';
  static String readProductUrl = '$baseUrl/ReadProduct';
  static String createProductUrl = '$baseUrl/CreateProduct';
  static String deleteProductUrl(String id) => '$baseUrl/DeleteProduct/$id';
}
