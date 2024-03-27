import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:greentouch/list/purchase_complete.dart';
import 'package:greentouch/service/cart_service.dart';
import 'package:provider/provider.dart';

import '../product/plant_service.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final TextEditingController addressController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(builder: (context, cartService, child) {
      List<Plant> product = cartService.product;
      double totalPrice = 0;
      for (var i = 0; i < product.length; i++) {
        totalPrice += product[i].price;
      }
      return Scaffold(
        appBar: BackAppbar(),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '구매물품',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF739072),
                    fontFamily: 'Jua',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      Plant products = product[index];
                      return ListTile(
                        leading: Image.asset(
                          products.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(products.title),
                        subtitle: Text('${products.price} 원'),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('총 가격'),
                  subtitle: Text('${totalPrice.toString()} 원'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '배송 주소 입력',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF739072),
                    fontFamily: 'Jua',
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: '주소를 입력해주세요.',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '카드 결제',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF739072),
                    fontFamily: 'Jua',
                  ),
                ),
                TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    hintText: '카드 번호를 입력해주세요.',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: expiryDateController,
                        decoration: InputDecoration(
                          hintText: '만료일 (MM/YY)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF739072),
                    fixedSize: Size(180, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PurchaseComplete()),
                    );
                  },
                  child: Text(
                    '결제하기',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Jua',
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
