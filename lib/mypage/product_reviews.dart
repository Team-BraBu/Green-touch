import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:greentouch/service/purchased_service.dart';
import 'package:provider/provider.dart';

import '../list/information_detail.dart';
import '../product/plant_service.dart';

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
  // late Plant plant;
  // 각 상품의 별점을 저장하는 맵
  Map<String, double> ratings = {};

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseService>(builder: (context, purchase, child) {
      List<Plant> purchased = purchase.purchasedItems;

      return Scaffold(
        appBar: BackAppbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 40, left: 40, right: 40),
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
                itemCount: purchased.length,
                itemBuilder: (context, index) {
                  final product = purchased[index];
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
                                      product.title,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InformationDetail(plant: product)),
                                  );
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
    });
  }
}
