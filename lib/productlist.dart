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
    );
  }
}

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
