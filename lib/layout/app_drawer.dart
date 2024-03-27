import 'package:flutter/material.dart';
import 'package:greentouch/mypage/mypage.dart';
import 'package:greentouch/service/auth_service.dart';
import 'package:provider/provider.dart';

import '../list/planteriorlist.dart';
import '../list/productlist.dart';
import '../mypage/calendar.dart';
import '../mypage/tab_cart.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/bo.png'),
              backgroundColor: Colors.white,
            ),
            accountName: Text(
              user == null ? '비회원☘️' : '${user.email}🍀',
              style: TextStyle(
                  color: Color(0xFF3A4D39), fontFamily: 'Jua', fontSize: 19),
            ),
            accountEmail: Text('', style: TextStyle(color: Colors.black)),
            onDetailsPressed: () {
              print('Header is clicked');
            },
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductList(),
                    ));
              },
              title: Text(
                '반려식물 보러가기',
                textAlign: TextAlign.end,
              ),
              textColor: Color(0xFF739072),
              titleTextStyle: TextStyle(
                  color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
            ),
          ),
          Divider(color: Color(0xFFF0EADB)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanteriorList(),
                    ));
              },
              title: Text(
                '인테리어 보러가기',
                textAlign: TextAlign.end,
              ),
              textColor: Color(0xFF739072),
              titleTextStyle: TextStyle(
                  color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
            ),
          ),
          Divider(color: Color(0xFFF0EADB)),
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabCart()),
                  );
                },
                title: Text(
                  '장바구니',
                  textAlign: TextAlign.end,
                ),
                textColor: Color(0xFF739072),
                titleTextStyle: TextStyle(
                    color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
              ),
            ),
          user != null
              ? Divider(color: Color(0xFFF0EADB))
              : Divider(color: Colors.transparent),
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPage()));
                },
                title: Text(
                  '내 정보 보기',
                  textAlign: TextAlign.end,
                ),
                textColor: Color(0xFF739072),
                titleTextStyle: TextStyle(
                    color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
              ),
            ),
          user != null
              ? Divider(color: Color(0xFFF0EADB))
              : Divider(color: Colors.transparent),
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarPage(),
                      ));
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xFF739072),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '캘린더',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF739072),
                        fontSize: 20,
                        fontFamily: 'Jua',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          user != null
              ? Divider(color: Color(0xFFF0EADB))
              : Divider(color: Colors.transparent),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ListTile(
          //     onTap: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => MyPage()));
          //     },
          //     title: Text(
          //       '내 주변 식물원',
          //       textAlign: TextAlign.end,
          //     ),
          //     textColor: Color(0xFF739072),
          //     titleTextStyle: TextStyle(
          //         color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
          //   ),
          // ),
          // Divider(color: Color(0xFFF0EADB)),
        ],
      ),
    );
  }
}
