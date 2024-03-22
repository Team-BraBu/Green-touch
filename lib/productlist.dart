import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> pimages = [
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
    ];

    final List<String> pcontents = [
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
    ];

    final List<String> pprices = [
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
    ];

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
                backgroundColor: Color(0xff739072), // background (button) color
                foregroundColor: Colors.white,
              ),
              child: Text('공기 정화 식물'),
            ),
            ElevatedButton(
              onPressed: () => _onCategorySelected('초보자 식물'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff739072), // background (button) color
                foregroundColor: Colors.white,
              ),
              child: Text('초보자 식물'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff739072), // background (button) color
                foregroundColor: Colors.white,
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
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: EdgeInsets.all(8),
              itemCount: categoryData[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final pimage = categoryData[selectedCategory]![index];
                // final pimage = pimages[index];
                // final pcontent = pcontents[index];
                // final pprice = pprices[index];
                return Card(
                  color: Color(0xffece3ce),
                  child: GestureDetector(
                    onTap: () {
                      // 상품 클릭 이벤트 처리
                    },
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            pimage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8),
                        //   child: Text(
                        //     pcontent,
                        //     style: TextStyle(color: Color(0xFF3A4D39)),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8),
                        //   child: Text(
                        //     pprice,
                        //     style: TextStyle(color: Color(0xFF3A4D39)),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
