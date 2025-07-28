import 'package:api_practice/Service/api_service.dart';
import 'package:flutter/material.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
//API কি?
//উত্তরঃ Application Programming interface মানে দুইটা সফটওয়্যার এর মধ্যে যোগাযোগ এর মাধ্যম।

class _MainPageState extends State<MainPage> {
  Map<String,dynamic>? user ;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
  }

  Future <void> loadUser()async{
    final fetchUser = await ApiService().fetchUser();
    setState(() {
      user = fetchUser;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Api Calling Practice'),
      ),
      body:isloading? Center(
        child: CircularProgressIndicator(),
      ) : user != null? Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user!['picture']['large']),
              ),
              SizedBox(height: 20,),
              Text('${user!['name']['first']}${user!['name']['last']}',
                style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('${user!['email']}'),

            ],
          ),
      ):Text('No user data')

    );
  }
}
