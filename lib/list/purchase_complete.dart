import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar.dart';
import 'package:greentouch/mypage/product_reviews.dart';


class PurchaseComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        // Top bar with the menu icon and logo
        SizedBox(height: 70,width: 10,),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
            children: [
            Icon(Icons.menu, size: 30), // Menu icon
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/logo4.png', // Replace with your asset
                        width: 100, // Adjust the size to fit your logo
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main content with images and text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/images/logo2.png',width: double.infinity,height: 250,
                ),
                  SizedBox(height: 16,width: 10,),
                  Text(
                    '구매가 완료되었습니다.',
                    style: TextStyle(color: Color(0xffD26F6F),fontFamily: 'Jua',fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16,width: 10,),
                  Text('총 결제금액', style: TextStyle(fontSize: 18)),
                  Text(
                    '29,000  원',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Button tap action
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductReview(),
                        ),
                      );
                    },
                    child: Text('반려식물 별점 주러가기'),
                    style: ElevatedButton.styleFrom(
                      // 버튼의 배경색
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  SizedBox(height: 17),
                  ElevatedButton(
                    onPressed: () {
                      // Button tap action
                    },
                    child: Text(
                      '돌아가기',
                      style: TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff3A4D39),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF739072),
                      fixedSize: Size(150,50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),

            // Bottom banner with fast delivery text
            Container(
              color: Colors.orange,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_shipping, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    '다음 빠른 배송을 준비하세요!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
