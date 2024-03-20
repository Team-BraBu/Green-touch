import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final plantItem = {
      "list": [
        {"image": "assets/images/plant1.png", "name": "아레카야자"},
        {"image": "assets/images/plant2.png", "name": "관음죽"},
        {"image": "assets/images/plant3.png", "name": "대나무야자"},
        {"image": "assets/images/plant4.png", "name": "인도고무나무"},
        {"image": "assets/images/plant5.jpg", "name": "아이비"},
        {"image": "assets/images/plant6.png", "name": "황금죽"},
        {"image": "assets/images/plant7.png", "name": "피닉스야자"},
        {"image": "assets/images/plant8.png", "name": "보스턴고사리"},
        {"image": "assets/images/plant9.png", "name": "스파티필름"},
        {"image": "assets/images/plant10.png", "name": "행운목"},
      ]
    };

    return Scaffold(
        appBar: AppBar(
          actions: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          children: List.generate(
            10,
            (index) {
              return Center(
                child: ListView(
                  children: <Widget>[
                    Image.asset('assets/images/plant1.png'),
                    // Image.asset('assets/images/plant2.png'),
                    // Image.asset('assets/images/plant/plant3.png'),
                    // Image.asset('assets/images/plant/plant4.png'),
                    // Image.asset('assets/images/plant/plant5.jpg'),
                    // Image.asset('assets/images/plant/plant6.png'),
                    // Image.asset('assets/images/plant/plant7.png'),
                    // Image.asset('assets/images/plant/plant8.png'),
                    // Image.asset('assets/images/plant/plant9.png'),
                    // Image.asset('assets/images/plant/plant10.png'),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
