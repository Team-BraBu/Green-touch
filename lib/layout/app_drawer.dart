import 'package:flutter/material.dart';
import 'package:greentouch/mypage.dart';

import '../tab_cart.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'ruah0807',
              style: TextStyle(
                  color: Color(0xFF3A4D39), fontFamily: 'Jua', fontSize: 22),
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
              title: Text(
                '반려식물 보러가기',
                textAlign: TextAlign.start,
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
              title: Text(
                '인테리어 보러가기',
                textAlign: TextAlign.start,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tabcart()),
                );
              },
              title: Text(
                '장바구니',
                textAlign: TextAlign.start,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPage()));
              },
              title: Text(
                '내 정보 보기',
                textAlign: TextAlign.start,
              ),
              textColor: Color(0xFF739072),
              titleTextStyle: TextStyle(
                  color: Color(0xFF739072), fontSize: 20, fontFamily: 'Jua'),
            ),
          ),
          Divider(color: Color(0xFFF0EADB)),
        ],
      ),
    );
  }
}
