import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentouch/mypage/mypage.dart';
import 'package:greentouch/list/planteriorlist.dart';
import 'package:greentouch/list/productlist.dart';
import 'package:greentouch/mypage/tab_cart.dart';
import 'package:greentouch/service/auth_service.dart';
import 'package:greentouch/user/login_Page.dart';
import 'package:greentouch/user/register_Page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug배너 삭제
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/newIconBig.png',
                width: double.infinity,
              ),
              Divider(color: Color(0xffF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductList(),
                            ));
                      },
                      child: SizedBox(
                        width: 370,
                        height: 90,
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              FontAwesomeIcons.pagelines,
                              size: 50,
                              color: Color(0xFF739072),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '반려식물 보러가기',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF739072),
                                fontFamily: 'Jua',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xffF0EADB)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanteriorList(),
                            ));
                      },
                      child: SizedBox(
                        width: 370,
                        height: 90,
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              Icons.home_outlined,
                              size: 50,
                              color: Color(0xFF739072),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '인테리어 보러가기',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF739072),
                                fontFamily: 'Jua',
                              ),
                            ),
                          ],
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
                    child: InkWell(
                      onTap: () {
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tabcart()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("회원 전용"),
                                  content: Text('로그인이 된 회원만 가능합니다.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('확인'))
                                  ],
                                );
                              });
                        }
                      },
                      child: SizedBox(
                        width: 370,
                        height: 90,
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 50,
                              color: Color(0xFF739072),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '장바구니',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF739072),
                                fontFamily: 'Jua',
                              ),
                            ),
                          ],
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
                    child: InkWell(
                      onTap: () {
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPage()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("회원 전용"),
                                  content: Text('로그인이 된 회원만 가능합니다.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('확인'))
                                  ],
                                );
                              });
                        }
                      },
                      child: SizedBox(
                        width: 370,
                        height: 90,
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              Icons.person_outline,
                              size: 50,
                              color: Color(0xFF739072),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '내 정보 보기',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF739072),
                                fontFamily: 'Jua',
                              ),
                            ),
                          ],
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
                  if (user == null)
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
                  if (user == null)
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
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
                            color: Color(0xFF739072),
                            fontFamily: 'Jua',
                          ),
                        ),
                      );
                    }),
                  if (user != null)
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<AuthService>().signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
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
                          '로그아웃',
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
