import 'package:flutter/material.dart';

import 'layout/app_drawer.dart';
import 'layout/appbar.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        padding: EdgeInsets.all(8),
        itemCount: pimages.length,
        itemBuilder: (context, index) {
          final pimage = pimages[index];
          final pcontent = pcontents[index];
          final pprice = pprices[index];
          return Card(
            color: Color(0xffece3ce),
            child: GestureDetector(
              onTap: () {
                // 상품 클릭 이벤트 처리
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        pimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      pcontent,
                      style: TextStyle(color: Color(0xFF3A4D39)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      pprice,
                      style: TextStyle(color: Color(0xFF3A4D39)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ProductImage(pimagePath: pimage)

// GridView.count(
// crossAxisCount: 2,
// crossAxisSpacing: 8,
// mainAxisSpacing: 8,
// padding: EdgeInsets.all(8),
// children: List<Widget>.generate(pimages.length, (index) {
// final String pimage = pimages[index];
// return Container(
// color: Color(0xFF3A4D39),
// child: Image.asset(pimage),
// );
// }),
// ),

// GridView.count(crossAxisCount: 2, children: [List.generate(pimages.length, (index) {
// return GestureDetector(
// child: Stack(
// children: [
// Positioned.fill(child: Image.asset(pimages, fit: BoxFit.fill,))
// ],
// ),
// );
// };),]),

// ListView.builder(
// itemCount: images.length,
// itemBuilder: (context, index) {
// final image = images[index];
// final content = contents[index];
// final hashtag = hashtags[index];
// final date = dates[index];
// return Feed(
// imagePath: image,
// contentPath: content,
// hashtagPath: hashtag,
// datePath: date,
// );
// },
// ));
