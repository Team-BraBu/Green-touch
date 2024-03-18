import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20), // 로고와 버튼 사이 여백 추가
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 동작할 코드 추가
                  // 예를 들어, 반려식물 페이지로 이동하는 코드
                },
                child: Text('반려식물 보러가기'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('인테리어 보러가기'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('장바구니'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('내 정보 보러가기'),
              ),
              Spacer(), // 아래에 여백을 채우기 위해 Spacer 위젯 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // 로그인 화면으로 이동하는 코드 추가
                    },
                    child: Text('로그인'),
                  ),
                  SizedBox(width: 50), // 버튼 간 간격을 주기 위해 SizedBox 추가
                  TextButton(
                    onPressed: () {
                      // 회원가입 화면으로 이동하는 코드 추가
                    },
                    child: Text('회원가입'),
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
