import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/layout/app_drawer.dart';

import 'layout/appbar.dart';

class Product {
  final String name;
  final double price;
  final String image;

  Product(this.name, this.price, this.image);
}

class Adimage {
  final String adimage;

  Adimage(this.adimage);
}

class ShoppingCart {
  final List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  void removeItem(Product product) {
    items.remove(product);
  }

  bool get isEmpty => items.isEmpty;
}

class tabcart extends StatefulWidget {
  @override
  _tabcartState createState() => _tabcartState();
}

class _tabcartState extends State<tabcart> {
  final ShoppingCart cart = ShoppingCart();
  Map<Product, bool> isChecked = {};
  Map<Product, int> quantities = {};

  int _current = 0;

  int getTotalCartPrice() {
    double totalPrice = 0;
    for (var product in cart.items) {
      int quantity = quantities[product] ?? 1;
      bool checked = isChecked[product] ?? true;
      if (checked) {
        totalPrice += product.price * quantity;
      }
    }
    return totalPrice.toInt();
  }

  List<Adimage> adImages = [];

  @override
  void initState() {
    super.initState();
    // 식물 더미 데이터
    cart.addItem(Product('보스턴고사리', 10000, 'assets/images/banner/tree1.png'));
    cart.addItem(Product('인도 고무나무', 15000, 'assets/images/banner/tree2.png'));
    cart.addItem(Product('떡갈 고무나무', 12000, 'assets/images/banner/tree3.jpg'));
    cart.addItem(Product('홍콩야자', 18000, 'assets/images/banner/tree4.png'));
    for (var product in cart.items) {
      quantities[product] = 1;
      isChecked[product] = true;
    }

    //광고 이미지 더미 데이터
    adImages.add(Adimage('assets/images/banner/1.jpg'));
    adImages.add(Adimage('assets/images/banner/2.jpg'));
    adImages.add(Adimage('assets/images/banner/3.jpg'));
    adImages.add(Adimage('assets/images/banner/4.jpg'));
    adImages.add(Adimage('assets/images/banner/5.jpg'));
    adImages.add(Adimage('assets/images/banner/6.jpg'));
    adImages.add(Adimage('assets/images/banner/7.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: adImages.map((adImage) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF3F1EC),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          adImage.adimage,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...Iterable<int>.generate(adImages.length).map(
                    (int pageIndex) => Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == pageIndex ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: Color(0xffF3F1EC),
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              '장바구니',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Color(0xffF3F1EC),
            padding: EdgeInsets.symmetric(vertical: 0.5),
          ),
          if (cart.items.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 90.0),
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 50.0,
                      color: Color(0xffF3F1EC),
                    ),
                    Text(
                      '장바구니에 상품이 없습니다',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffF3F1EC),
                      ),
                    ),
                    Text(
                      '상품을 추가해보세요',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffF3F1EC),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (cart.items.isNotEmpty)
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: cart.items.isNotEmpty &&
                            isChecked.values.every((value) => value),
                        onChanged: (value) {
                          setState(() {
                            if (cart.items.isNotEmpty) {
                              isChecked.updateAll((key, _) => value ?? true);
                            }
                          });
                        },
                        checkColor: Colors.white, // 체크 마크 색상
                        activeColor: Color(0xff739072), // 활성화된 상태의 체크박스 배경 색상
                      ),
                      Text(
                        '전체 ${cart.items.length}개',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                int quantity = quantities[product] ?? 1;
                double totalPrice = product.price * quantity;

                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(6.0),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: isChecked[product] ?? true,
                          onChanged: (value) {
                            setState(() {
                              isChecked[product] = value ?? true;
                            });
                          },
                          checkColor: Colors.white, // 체크 마크 색상
                          activeColor: Color(0xff739072), // 활성화된 상태의 체크박스 배경 색상
                        ),
                        Container(
                          width: 100.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(product.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '수량: $quantity',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          quantities[product] = quantity - 1;
                                        });
                                      }
                                    },
                                    padding: EdgeInsets.only(right: 4.0),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        quantities[product] = quantity + 1;
                                      });
                                    },
                                    padding: EdgeInsets.only(left: 4.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cart.removeItem(product);
                                  isChecked.remove(product);
                                });
                                // 상품 삭제 후에 전체 체크된 상품의 개수를 업데이트
                                setState(() {
                                  isChecked.values
                                      .where((value) => value)
                                      .length;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 100.0),
                            Text(
                              '${totalPrice.toStringAsFixed(0)}원',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (cart.items.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff739072)),
                      minimumSize: MaterialStateProperty.all(Size(370, 60)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 18.0),
                      ),
                    ),
                    child: Text(
                      '총: ${isChecked.values.where((value) => value).length}개  |  ${getTotalCartPrice()}원 결제하기',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
