import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('로고 넣을 자리 / 상품리스트 화면'),
      ),
      // GridView count 생성자로, 그리드 내 아이템 수를 기반으로 레이아웃을 구성할 수 있다.
      body: GridView.count(
        // 크로스축으로 아이템이 2개씩 배치되도록 설정
        crossAxisCount: 2,
        // 그리드의 주축(세로) 사이의 아이템 공간 설정
        mainAxisSpacing: 8,
        // 그리드의 크로스축(가로) 사이의 아이템 공간 설정
        crossAxisSpacing: 8,
        // 그리드 전체에 대한 패딩 설정
        padding: EdgeInsets.all(8),
        children: [],
      ),
    );
  }
}
