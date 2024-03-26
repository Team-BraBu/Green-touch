import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/layout/app_drawer.dart';
import 'package:greentouch/layout/appbar.dart';
import 'package:greentouch/main_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  List<String> _images = [
    'assets/images/Bob.jpg',
    'assets/images/Kevin.jpg',
    'assets/images/Stuart.jpg',
  ];
  String? _selectedImagePath;

  List<bool> _isSelected = [false, false, false]; // 이미지 선택 여부를 저장하는 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '회원가입',
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
                labelText: '아이디',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _register();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF739072),
                fixedSize: Size(380, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                '회원가입',
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

  void _register() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showAlert('경고', '모든 필수 정보를 입력해주세요.');
      return;
    }

    if (password != confirmPassword) {
      _showAlert('경고', '비밀번호와 비밀번호 확인이 일치하지 않습니다.');
      return;
    }

    // 이미 등록된 아이디인지 확인
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existingUsername = prefs.getString('username');
    if (existingUsername == username) {
      _showAlert('경고', '이미 등록된 아이디입니다.');
      return;
    }

    // 회원가입 정보를 SharedPreferences에 저장
    await prefs.setString('username', username);
    await prefs.setString('password', password);

    // 회원가입 성공시 성공 다이얼로그 표시
    _showSuccessDialog();
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

  void _setProfilePicture(String? imagePath) async {
    // 선택된 이미지를 SharedPreferences에 저장
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_picture', imagePath ?? '');

    // 이미지를 저장한 후에는 프로필 사진을 설정하는 등의 추가적인 작업을 수행할 수 있습니다.
    // 이 예시에서는 SharedPreferences에 이미지 경로만 저장했습니다.
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('성공'),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            width: 300,
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('회원가입이 성공적으로 완료되었습니다.'),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: _images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelected[index] = !_isSelected[index];
                          });
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _isSelected[index]
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                              child: Image.asset(
                                _images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Checkbox(
                                value: _isSelected[index],
                                onChanged: (newValue) {
                                  setState(() {
                                    _isSelected[index] = newValue ?? false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _setProfilePicture(_selectedImagePath);
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
