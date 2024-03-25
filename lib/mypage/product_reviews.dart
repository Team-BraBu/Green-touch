import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greentouch/layout/appbar_back.dart';

// 데이터 모델 정의
class Product {
  final String name;
  final String imagePath;

  Product(this.name, this.imagePath);
}

class ProductReview extends StatefulWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  // 상품 데이터 생성
  final List<Product> products = [
    Product('아레카야자', 'assets/plant/plant1.png'),
    Product('관음죽', 'assets/plant/plant2.png'),
    Product('대나무야자', 'assets/plant/plant3.png'),
    Product('아레카야자1', 'assets/plant/plant4.png'),
  ];

  // 각 상품의 별점을 저장하는 맵
  Map<String, double> ratings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40, left: 40, right: 40),
            child: Row(
              children: [
                SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '상품 리뷰',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jua',
                          color: Color(0xff739072)),
                    ),
                    Text(
                      '구매하신 상품의 별점을 주세요 ⭐️',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3A4D39),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Color(0xffF0EADB),
            thickness: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffF0EADB),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              product.imagePath,
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 23,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (_) => InformationDetail(plant : plant)),
                                // );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '더보기',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff739072),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.chevron_forward,
                                    size: 40,
                                    color: Color(0xff739072),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '상품 페이지입니다: ${product.name}',
              style: TextStyle(fontSize: 24),
            ),
            // 상품 페이지 컨텐츠 추가
          ],
        ),
      ),
    );
  }
}
