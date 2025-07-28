import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService{
  Future<Map<String,dynamic>> fetchUser() async
  {
    //...
    final url = Uri.parse('https://randomuser.me/api/');//মূলত এই লাইনে এ পি আই কল হচ্ছে
    final response =  await http.get(url);// এটা দিয়ে ডেটা চাইলাম আমি URL এর কাছে
    //...
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return data['results'][0];
    }
    else{
      throw Exception('Failed to load user');
    }

  }

}