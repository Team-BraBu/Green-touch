import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:greentouch/list/planteriorlist.dart';
import 'package:greentouch/mypage/purchase.dart';
import 'package:greentouch/service/cart_service.dart';
import 'package:provider/provider.dart';

import '../product/plant_service.dart';

class Product {
  final String name;
  final double price;
  final String image;
  int quantity;

  Product(this.name, this.price, this.image, {this.quantity = 1});
}

class Adimage {
  final String adimage;

  Adimage(this.adimage);
}

class ShoppingCart extends ChangeNotifier {
  final List<Product> items = [];

  void addItem(Product product) {
    // 이미 장바구니에 있는 상품인지 확인합니다.
    final existingIndex = items.indexWhere((item) => item.name == product.name);

    if (existingIndex != -1) {
      // 이미 장바구니에 있는 상품인 경우, 수량을 증가시킵니다.
      items[existingIndex].quantity += product.quantity;
    } else {
      // 장바구니에 없는 상품인 경우, 새로운 상품으로 추가합니다.
      items.add(product);
    }

    notifyListeners(); // 상태 변경을 알림
  }

  void removeItem(Product product) {
    items.remove(product);
    notifyListeners(); // 상태 변경을 알림
  }

  bool get isEmpty => items.isEmpty;
}

class TabCart extends StatefulWidget {
  @override
  _TabCartState createState() => _TabCartState();
}

class _TabCartState extends State<TabCart> {
  Map<Product, bool> isChecked = {};
  Map<Product, int> quantities = {};

  int _current = 0;

  int getTotalCartPrice(ShoppingCart cart) {
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

    //광고 이미지 더미 데이터
    adImages.add(Adimage('assets/banner/1.jpg'));
    adImages.add(Adimage('assets/banner/2.jpg'));
    adImages.add(Adimage('assets/banner/3.jpg'));
    adImages.add(Adimage('assets/banner/4.jpg'));
    adImages.add(Adimage('assets/banner/5.jpg'));
    adImages.add(Adimage('assets/banner/6.jpg'));
    adImages.add(Adimage('assets/banner/7.jpg'));

    PlantService plantService = PlantService();

    // getCategoryPlants 함수 호출 시 PlantService 객체 전달
    List<Plant> categoryPlants = getCategoryPlants(1, plantService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BackAppbar(),
      body: ChangeNotifierProvider(
        create: (context) => ShoppingCart(), // 쇼핑카트 프로바이더 생성
        child: Consumer<CartService>(builder: (context, cartService, child) {
          final cartItems = cartService.product;
          final ShoppingCart cart =
              Provider.of<ShoppingCart>(context); // 장바구니 상태 가져오기
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlanteriorList(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/banner/ad_planterior.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // height: 150.0,
                ),
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
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Jua',
                      color: Color(0xff739072)),
                ),
              ),
              Container(
                color: Color(0xffF3F1EC),
                padding: EdgeInsets.symmetric(vertical: 0.5),
              ),
              if (cartItems.isEmpty)
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 90.0),
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 50.0,
                          color: Color(0xffECE3CE),
                        ),
                        Text(
                          '장바구니에 상품이 없습니다',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffECE3CE),
                          ),
                        ),
                        Text(
                          '상품을 추가해보세요',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xffECE3CE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (cartItems.isEmpty) SizedBox(height: 140.0),
              if (cartItems.isEmpty)
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
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == pageIndex
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(6.0),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.0,
                              height: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0, // 테두리 두께
                                ),
                                image: DecorationImage(
                                  image: AssetImage(product.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 25),
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      color: Color(0xFF3A4D39),
                                      fontSize: 20.0,
                                      fontFamily: 'Jua',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        '수량: ',
                                        style: TextStyle(
                                          color: Color(0xFF3A4D39),
                                          fontSize: 18.0,
                                          fontFamily: 'Jua',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (product.quantity > 1) {
                                              product.quantity--;
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        '${product.quantity}',
                                        style: TextStyle(
                                          color: Color(0xFF3A4D39),
                                          fontSize: 18.0,
                                          fontFamily: 'Jua',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            product.quantity++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<CartService>()
                                        .removeItems(product);
                                  },
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: Color(0xff3A4D39),
                                  ),
                                ),
                                SizedBox(height: 85.0),
                                Text(
                                  '${product.price * product.quantity}원',
                                  style: TextStyle(
                                    color: Color(0xff3A4D39),
                                    fontFamily: 'Jua',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
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
                  if (cartItems.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PurchasePage(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff739072)),
                              minimumSize:
                                  MaterialStateProperty.all(Size(370, 60)),
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
                              '총 ${cartItems.length}개  |  ${calculateTotalPrice(cartItems)} 원 결제하기',
                              style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.white,
                                fontFamily: 'Jua',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // 간격 조절을 위한 SizedBox 추가
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  int calculateTotalPrice(List<Plant> cartItems) {
    int totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}
