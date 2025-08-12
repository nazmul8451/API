import 'package:flutter/material.dart';
class product_card extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;



  const product_card({
    super.key, required this.onEdit, required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.60,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.white,
            child: SizedBox(
              height: 500,
              width: 100,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.network('https://5.imimg.com/data5/KO/DN/MY-18579035/gym-dumble-1000x1000.jpg'),
                    SizedBox(height: 3,),
                    Text('Product Title',overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 2,),
                    Text('Product Details',overflow: TextOverflow.ellipsis,maxLines: 2,),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: onEdit,
                          icon: Icon(Icons.edit,color: Colors.green,),
                        ),
                        SizedBox(width: 10,),
                        IconButton(
                          onPressed: onDelete,
                          icon: Icon(Icons.delete,color: Colors.red,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}