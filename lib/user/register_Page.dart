import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/layout/app_drawer.dart';
import 'package:greentouch/layout/appbar.dart';
import 'package:greentouch/main_Page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Padding(
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF739072),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '아이디를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF739072),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '비밀번호를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '비밀번호를 다시 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFF739072),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
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
      ),
    );
  }
}
