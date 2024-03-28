import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar.dart';
import 'package:greentouch/list/productlist.dart';
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
          SizedBox(
            height: 70,
            width: 10,
          ),
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
          // ... Other code above remains the same ...

// Replace the Expanded widget that contains the ElevatedButton widgets with the following:

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo2.jpg',
                  width: double.infinity,
                  height: 250,
                ),
                SizedBox(height: 16),
                Text(
                  '구매가 완료되었습니다.',
                  style: TextStyle(
                    color: Color(0xffD26F6F),
                    fontFamily: 'Jua',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      child: Text(
                        '별점⭐️주러가기',
                        style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFECE3CE),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                    SizedBox(width: 10), // Add some space between the buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductList()),
                        );
                      },
                      child: Text(
                        '돌아가기',
                        style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFECE3CE),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF739072),
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),

// ... The rest of the code remains the same ...

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
