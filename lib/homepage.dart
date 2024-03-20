import 'package:flutter/material.dart';
import 'package:greentouch/productlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('로고 넣을 자리'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductList(),
                  ));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
