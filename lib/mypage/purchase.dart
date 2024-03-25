import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar.dart';
import '../layout/app_drawer.dart';

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
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text(
              '배송 주소 입력',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Color(0xFF739072),
                fontFamily: 'Jua',),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Color(0xFF739072),
                fontFamily: 'Jua',),
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
              onPressed: () {},
              child: Text(
                  '결제하기',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
