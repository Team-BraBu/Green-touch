import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(builder: (context, cartService, child) {
      List<Plant> product = cartService.product;
      double totalPrice = 0;
      for (var i = 0; i < product.length; i++) {
        totalPrice += product[i].price;
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BackAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '구매물품\t${product.length}개',
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                  keyboardType: TextInputType.number,
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        obscureText: true,
                        controller: cvvController,
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffece3ce),
                        fixedSize: Size(180, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<CartService>().removeCartItems();
                        Navigator.pop(context);
                      },
                      child: Text(
                        '구매취소',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff3a4d39),
                          fontFamily: 'Jua',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF739072),
                        fixedSize: Size(180, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (addressController.text.isEmpty) {
                          showSnackBar(context, '주소를 입력해주세요.');
                        } else if (cardNumberController.text.length != 16) {
                          showSnackBar(context, '올바른 카드번호가 아닙니다.');
                        } else if (expiryDateController.text.isEmpty) {
                          showSnackBar(context, '만료일을 입력해주세요.');
                        } else if (cvvController.text.isEmpty) {
                          showSnackBar(context, 'cvv번호를 입력해주세요.');
                        } else {
                          // CartService 인스턴스 가져오기
                          var cartService =
                              Provider.of<CartService>(context, listen: false);

                          // 장바구니 비우기 및 구매 완료한 상품 목록 ReviewService로 전송
                          // 이 작업은 CartService의 removeCartItems 메소드 내에서 이미 처리됩니다.
                          cartService.removeCartItems();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PurchaseComplete(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        '${totalPrice.toString()} 원 결제하기',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Jua',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
