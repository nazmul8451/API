import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetMethodPractice extends StatefulWidget {
  const GetMethodPractice({super.key});

  @override
  State<GetMethodPractice> createState() => _GetMethodPracticeState();
}

class _GetMethodPracticeState extends State<GetMethodPractice> {
  List<dynamic> postList = [];
  bool progressIsLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  Future getPost() async {
    progressIsLoading = true;
    setState(() {});
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonPost = jsonDecode(response.body);
      setState(() {
        progressIsLoading = false;
        postList = jsonPost;
      });
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Get method practice'),
      ),
      body: Visibility(
        visible: progressIsLoading == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final list = postList[index];
              return ListTile(
                onTap: () {},
                title: Text('title: ${list['title']}'),
                subtitle: Text(
                  'Details: ${list['body']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
      ),
    );
  }
}
