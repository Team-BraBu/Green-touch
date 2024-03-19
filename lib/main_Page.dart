import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 0),
              Divider(color: Color(0xFFF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 250,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.yard_outlined,
                          size: 50,
                          color: Color(0xFF739072),
                        ),
                        label: Text(
                          '반려식물 보러가기',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF739072),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 250,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cottage_outlined,
                          size: 50,
                          color: Color(0xFF739072),
                        ),
                        label: Text(
                          '인테리어 보러가기',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF739072),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 165,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          size: 50,
                          color: Color(0xFF739072),
                        ),
                        label: Text(
                          '장바구니',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF739072),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 235,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_outline,
                          size: 50,
                          color: Color(0xFF739072),
                        ),
                        label: Text(
                          '내 정보 보러가기',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF739072),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '회원 가입',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF739072),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF739072),
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
  }
}
