import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
//API কি?
//উত্তরঃ Application Programming interface মানে দুইটা সফটওয়্যার এর মধ্যে যোগাযোগ এর মাধ্যম।

class _MainPageState extends State<MainPage> {
  List<dynamic> userList = [];
  bool _userListInProgress = false;

  Future getUser() async {
    _userListInProgress = true;
    setState((){});

    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    final response = await get(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final jsonData = jsonDecode(response.body);
      setState(() {
        userList = jsonData;
        _userListInProgress = false;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Api get method calling practice'),
      ),
      body: Visibility(
        visible: _userListInProgress == false,
        replacement: Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
        )),
        child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(

                onTap: (){},
                title: Text(
                  user['name'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  user['email'],
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                leading: CircleAvatar(
                  child: Text(user['name'][0]),
                ),
              );
            }),
      ),
    );
  }
}
