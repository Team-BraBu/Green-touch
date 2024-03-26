import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/review_service.dart';

class ProductReview extends StatefulWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  late double _rating;
  late PlantReviewService reviewService;
  late TextEditingController _ratingController;

  final List<PlantReviewService> products = [
    PlantReviewService('아레카야자', 'assets/plant/plant1.png'),
    PlantReviewService('관음죽', 'assets/plant/plant2.png'),
    PlantReviewService('대나무야자', 'assets/plant/plant3.png'),
    PlantReviewService('아레카야자1', 'assets/plant/plant4.png'),
  ];

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController();
    _loadRating();
  }

  // 저장된 별점을 불러와서 _rating 변수에 할당
  void _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedRating = prefs.getDouble('rating') ?? 0.0;
    setState(() {
      _rating = savedRating;
      _ratingController.text = _rating.toStringAsFixed(1);
    });
  }

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
                return ChangeNotifierProvider.value(
                  value: product, // 상품 객체를 상태로 제공
                  child: _ProductItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatefulWidget {
  @override
  State<_ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<_ProductItem> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final review = Provider.of<PlantReviewService>(context);
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
                  review.imagePath,
                  width: 120,
                  height: 120,
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      RatingBar.builder(
                        initialRating: _rating,
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
                          setState(() {
                            _rating = rating;
                          });
                          _saveRating(rating); // 별점 저장
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
  }

  // 별점을 Shared Preferences에 저장
  void _saveRating(double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('rating', rating);
  }
}
