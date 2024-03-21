import 'package:flutter/material.dart';
import 'package:greentouch/productlist_image.dart';

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

    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('assets/images/logo.png'),
        ],
      ),
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
          return GestureDetector(
            onTap: () {
              // 상품 클릭 이벤트 처리
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFFF0EADB),
                    child: Image.asset(
                      pimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '상품 이름 $index',
                    style: TextStyle(color: Color(0xFF3A4D39)),
                  ),
                )
              ],
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
