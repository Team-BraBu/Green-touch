import 'package:flutter/material.dart';
import 'package:greentouch/mypage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tab_cart.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    setState(() {
      _username = username;
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _username = null;
    });
  }

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
            accountName: _username != null
                ? Text(
                    _username!,
                    style: TextStyle(
                      color: Color(0xFF3A4D39),
                      fontFamily: 'Jua',
                      fontSize: 22,
                    ),
                  )
                : SizedBox(), // 사용자 이름이 없을 때 빈 SizedBox 표시
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
          if (_username != null) // 로그인 상태일 때만 장바구니와 로그아웃 버튼 표시
            Column(
              children: [
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
                        color: Color(0xFF739072),
                        fontSize: 20,
                        fontFamily: 'Jua'),
                  ),
                ),
                Divider(color: Color(0xFFF0EADB)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      _logout();
                    },
                    title: Text(
                      '로그아웃',
                      textAlign: TextAlign.start,
                    ),
                    textColor: Color(0xFF739072),
                    titleTextStyle: TextStyle(
                        color: Color(0xFF739072),
                        fontSize: 20,
                        fontFamily: 'Jua'),
                  ),
                ),
                Divider(color: Color(0xFFF0EADB)),
              ],
            ),
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
