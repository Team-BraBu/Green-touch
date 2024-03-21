import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentouch/planteriorlist.dart';
import 'package:greentouch/user/login_Page.dart';
import 'package:greentouch/user/register_Page.dart';

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
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            FontAwesomeIcons.pagelines,
                            size: 50,
                            color: Color(0xFF739072),
                          ),
                        ),
                        label: Text(
                          '반려식물 보러가기',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF739072),
                            fontFamily: 'Jua',
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
                      child: Builder(builder: (context) {
                        return TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlanteriorList(),
                                ));
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.cottage_outlined,
                              size: 50,
                              color: Color(0xFF739072),
                            ),
                          ),
                          label: Text(
                            '인테리어 보러가기',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF739072),
                              fontFamily: 'Jua',
                            ),
                          ),
                        );
                      }),
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
                      width: 175,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 50,
                            color: Color(0xFF739072),
                          ),
                        ),
                        label: Text(
                          '장바구니',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF739072),
                            fontFamily: 'Jua',
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
                      width: 202,
                      height: 90,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.person_outline,
                            size: 50,
                            color: Color(0xFF739072),
                          ),
                        ),
                        label: Text(
                          '내 정보 보기',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF739072),
                            fontFamily: 'Jua',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFFF0EADB)),
              SizedBox(height: 70), // 버튼 위에 여백 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF739072),
                        fixedSize: Size(180, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '회원 가입',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'Jua',
                        ),
                      ),
                    );
                  }),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFECE3CE),
                        fixedSize: Size(180, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'Jua',
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
