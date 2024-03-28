import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../layout/appbar_back.dart';
import '../list/information_detail.dart';
import '../service/review_service.dart';

class MyPurchasing extends StatefulWidget {
  const MyPurchasing({super.key});

  @override
  State<MyPurchasing> createState() => _MyPurchasingState();
}

class _MyPurchasingState extends State<MyPurchasing> {
  @override
  Widget build(BuildContext context) {
    var reviewService = Provider.of<ReviewService>(context);
// ReviewService의 purchaseItems 리스트를 먼저 정렬
    var sortedPurchasedItems = reviewService.purchaseItems;
    sortedPurchasedItems
        .sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
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
                      '구매 내역',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jua',
                          color: Color(0xff739072)),
                    ),
                    Text(
                      '여기에서 구매하신 상품의 내역을 확인하세요.',
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
              itemCount: sortedPurchasedItems.length,
              itemBuilder: (context, index) {
                final productItem = sortedPurchasedItems[index];
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
                              productItem.plant.imagePath,
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productItem.plant.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '구매 날짜: ${DateFormat('yyyy-MM-dd').format(productItem.purchaseDate)}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InformationDetail(
                                          plant: productItem.plant)),
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
  }
}
