import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greentouch/list/productlistitem.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';
import 'information_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // 상품 데이터 인스턴스 생성
  final ProductData productData = ProductData.defaultData;

  String selectedCategory = '공기 정화 식물';

  // 카테고리
  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
                minimumSize: Size(10, 30),
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
                minimumSize: Size(10, 30),
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
                minimumSize: Size(10, 30),
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
              itemCount: productData.images[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final pimage = productData.images[selectedCategory]![index];
                final pcontent = productData.names[selectedCategory]![index];
                final pprice = productData.prices[selectedCategory]![index];
                return ProductListItem(
                  imagePath: pimage,
                  title: pcontent,
                  subtitle: 'subtitle',
                  price: pprice,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationDetail(),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

class ProductData {
  final Map<String, List<String>> images;
  final Map<String, List<String>> names;
  final Map<String, List<String>> prices;

  ProductData(
      {required this.images, required this.names, required this.prices});

  static ProductData get defaultData => ProductData(
        images: {
          '공기 정화 식물': [
            'assets/plant/plant1.png',
            'assets/plant/plant2.png',
            'assets/plant/plant3.png',
            'assets/plant/plant4.png',
            'assets/plant/plant5.jpg',
            'assets/plant/plant6.png',
            'assets/plant/plant7.png',
            'assets/plant/plant8.png',
            'assets/plant/plant9.png',
            'assets/plant/plant10.png',
          ],
          '초보자 식물': [
            'assets/plant/plant11.jpg',
            'assets/plant/plant12.png',
            'assets/plant/plant13.jpg',
            'assets/plant/plant14.png',
            'assets/plant/plant15.jpg',
          ]
        },
        names: {
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
        },
        prices: {
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
          ],
        },
      );
}
