import 'package:api_practice/Service/api_service.dart';
import 'package:flutter/material.dart';

class NewProductcreateScreen extends StatelessWidget {
  NewProductcreateScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Create New Product'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                icon: Icon(Icons.title),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                icon: Icon(Icons.description),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.bookmark_added),
      ),
    );
  }
}
