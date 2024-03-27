import 'package:flutter/material.dart';

class Purchasecomplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Top bar with the menu icon and logo
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.menu, size: 30), // Menu icon
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/pang2.png', // Replace with your asset
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
                    Image.asset('assets/images/plant1.png'), // Confetti image
                    SizedBox(height: 16),
                    Text(
                      '구매가 완료되었습니다.',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Button tap action
                      },
                      child: Text('구매 내역 돌아가기'),
                      style: ElevatedButton.styleFrom(
                        // 버튼의 배경색
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                    Spacer(),
                    Text('결제금액',
                        style: TextStyle(fontSize: 22, color: Colors.red)),
                    Text('29,000원',
                        style: TextStyle(fontSize: 24, color: Colors.black)),
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
        ),
      ),
    );
  }
}
