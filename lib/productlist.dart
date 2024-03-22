import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greentouch/productlistitem.dart';

import 'layout/app_drawer.dart';
import 'layout/appbar.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String selectedCategory = '공기 정화 식물';
  Map<String, List<String>> categoryData = {
    '공기 정화 식물': [
      'assets/images/plant/plant1.png',
      'assets/images/plant/plant2.png',
      'assets/images/plant/plant3.png',
      'assets/images/plant/plant4.png',
      'assets/images/plant/plant5.jpg',
      'assets/images/plant/plant6.png',
      'assets/images/plant/plant7.png',
      'assets/images/plant/plant8.png',
      'assets/images/plant/plant9.png',
      'assets/images/plant/plant10.png',
    ],
    '초보자 식물': [
      'assets/images/plant/plant11.jpg',
      'assets/images/plant/plant12.png',
      'assets/images/plant/plant13.jpg',
      'assets/images/plant/plant14.png',
      'assets/images/plant/plant15.jpg',
    ]
  };

  Map<String, List<String>> categoryData2 = {
    '공기 정화 식물': [
      '아레카 야자',
      '관음죽',
      '대나무 야자',
      '인도 고무나무',
      '아이비',
      '황금죽',
      '피닉스 야자',
      '보스턴 고사리',
      '스파티 필름',
      '행운목'
    ],
    '초보자 식물': [
      '스킨답서스',
      '홍콩 야자',
      '테이블 야자',
      '박쥐란',
      '떡갈 고무나무',
    ]
  };

  Map<String, List<String>> categoryData3 = {
    '공기 정화 식물': [
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
    ],
    '초보자 식물': [
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
      '20,000원',
    ]
  };

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // 카테고리 선택 여부
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
              onPressed: () => _onCategorySelected('공기 정화 식물'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 30),
                backgroundColor: selectedCategory == '공기 정화 식물'
                    ? Color(0xff739072)
                    : Colors.white, // background (button) color
                foregroundColor: selectedCategory == '공기 정화 식물'
                    ? Colors.white
                    : Color(0xff739072),
              ),
              child: Text('공기 정화 식물'),
            ),
            ElevatedButton(
              onPressed: () => _onCategorySelected('초보자 식물'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == '초보자 식물'
                    ? Color(0xff739072)
                    : Colors.white, // background (button) color
                foregroundColor: selectedCategory == '초보자 식물'
                    ? Colors.white
                    : Color(0xff739072),
              ),
              child: Text('초보자 식물'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == '기타 등등'
                    ? Color(0xff739072)
                    : Colors.white, // background (button) color
                foregroundColor: selectedCategory == '기타 등등'
                    ? Colors.white
                    : Color(0xff739072),
              ),
              child: Text('기타 등등'),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 1 의 비율
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: EdgeInsets.all(8),
              itemCount: categoryData[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final pimage = categoryData[selectedCategory]![index];
                final pcontent = categoryData2[selectedCategory]![index];
                final pprice = categoryData3[selectedCategory]![index];
                return ProductListItem(
                  imagePath: pimage,
                  title: pcontent,
                  subtitle: 'subtitle',
                  price: pprice,
                  onTap: () {
                    // 상품 클릭 이벤트 처리
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
