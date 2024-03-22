import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:greentouch/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '로그인',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Color(0xFF3A4D39),
                fontFamily: 'Jua',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF739072),
                  ),
                ),
                labelText: '아이디',
                labelStyle: TextStyle(
                  color: Color(0xFF739072),
                ),
                hintText: '아이디를 입력해주세요.',
                hintStyle: TextStyle(
                  color: Color(0xFF739072),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF739072),
                  ),
                ),
                labelText: '비밀번호',
                labelStyle: TextStyle(
                  color: Color(0xFF739072),
                ),
                hintText: '비밀번호를 입력해주세요.',
                hintStyle: TextStyle(
                  color: Color(0xFF739072),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF739072),
                fixedSize: Size(380, 60),
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
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showAlert('경고', '아이디와 비밀번호를 입력해주세요.');
      return;
    }

    // SharedPreferences에서 회원 가입 정보 가져오기
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    // 입력한 아이디와 비밀번호와 저장된 정보 비교
    if (username == savedUsername && password == savedPassword) {
      // 로그인 성공 시 메인 페이지로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      _showAlert('경고', '아이디 또는 비밀번호가 일치하지 않습니다.');
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
