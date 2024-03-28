import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/mypage/history.dart';
import 'package:greentouch/mypage/mission.dart';
import 'package:greentouch/list/planteriorlist.dart';
import 'package:greentouch/mypage/recommanded.dart';
import 'package:greentouch/mypage/product_reviews.dart';
import 'package:greentouch/service/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'calendar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences import 추가
import '../layout/app_drawer.dart';
import '../layout/appbar.dart';
import 'my_purchasing.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _profileImageUrl; // 프로필 사진 URL 추가

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadProfileImage(); // 프로필 사진 URL 불러오기
  }

  // 프로필 사진 URL 불러오기
  Future<void> _loadProfileImage() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Firebase에서 사용자의 프로필 이미지 URL 가져오기
      String? profileImageUrl = user.photoURL;
      if (profileImageUrl != null) {
        setState(() {
          _profileImageUrl = profileImageUrl;
        });
      }
    }
  }

  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref()
              .child('profile_images')
              .child('${user.uid}.jpg');

          // 이미지 데이터를 Firebase Storage에 업로드
          await ref.putData(bytes);

          // 업로드된 이미지의 다운로드 URL을 가져옴
          final imageUrl = await ref.getDownloadURL();

          // SharedPreferences에 프로필 사진 URL 저장
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('profileImageUrl', imageUrl);

          // 사용자 정보 업데이트 (프로필 이미지 URL 저장)
          await context.read<AuthService>().updateProfilePicture(imageUrl);

          // 프로필 사진 URL을 다시 가져와서 UI 업데이트
          await _loadProfileImage();

          // 업로드 완료 메시지 표시
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('프로필 사진이 업로드되었습니다.')),
          );
        }
      } catch (e) {
        // 오류 발생 시 오류 메시지 출력
        print('프로필 사진 업로드 오류: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('프로필 사진을 업로드하는 도중 오류가 발생했습니다.')),
        );
      }
    } else {
      // 이미지를 선택하지 않았을 때 메시지 출력
      print('사용자가 이미지를 선택하지 않았습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 30, left: 30, right: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _changeProfilePicture();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xfff0eadb),
                    child: _profileImageUrl != null
                        ? ClipOval(
                            child: Image.network(
                              _profileImageUrl!,
                              fit: BoxFit.cover,
                              width: 100, // 이미지 크기 조정
                              height: 100, // 이미지 크기 조정
                            ),
                          )
                        : Icon(
                            Icons.account_circle, // 이미지가 없는 경우 기본 아이콘
                            size: 100, // 아이콘 크기 조정
                            color: Colors.grey, // 아이콘 색상 설정
                          ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  user == null ? '비회원' : '${user.email}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(height: 40),
                    IconButton(
                      icon: Icon(
                        Icons.edit_calendar,
                        color: Color(0xff739072),
                      ),
                      iconSize: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Color(0xfff0eadb),
            thickness: 10,
          ),
          TabBar(
            controller: _tabController,
            labelColor: Color(0xff3A4D39),
            indicatorColor: Color(0xff3A4D39),
            unselectedLabelColor: Color(0xff94A194),
            dividerColor: Color(0xfff0eadb),
            tabs: [
              Tab(
                child: Text(
                  '활   동',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    fontSize: 20, // 원하는 크기로 조정
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '쇼   핑',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    fontSize: 20, // 원하는 크기로 조정
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 활동 탭 내용
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // 버튼이 눌렸을 때 수행할 동작 추가
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Recommand(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 35, bottom: 25, left: 40, right: 30),
                        child: Row(
                          children: [
                            Text(
                              '추천 활동',
                              style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: 19,
                                color: Color(0xFF739072),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF739072)),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Color(0xffF0EADB)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductReview(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 28, bottom: 25, left: 40, right: 30),
                        child: Row(
                          children: [
                            Text(
                              '후기 작성',
                              style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: 19,
                                color: Color(0xFF739072),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF739072)),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Color(0xffF0EADB)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MissionPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 28, bottom: 25, left: 40, right: 30),
                        child: Row(
                          children: [
                            Text(
                              '오늘의 미션',
                              style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: 19,
                                color: Color(0xFF739072),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF739072)),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Color(0xffF0EADB)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HistoryPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 28, bottom: 25, left: 40, right: 30),
                        child: Row(
                          children: [
                            Text(
                              '내 활동 내역',
                              style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: 19,
                                color: Color(0xFF739072),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF739072)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // 쇼핑 탭 내용
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 0, left: 30, right: 20),
                      child: Text(
                        '최근 주문',
                        style: TextStyle(
                            fontFamily: 'Jua',
                            fontSize: 20,
                            color: Color(0xFF739072)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20), // 컨테이너 내부에 패딩을 추가합니다.
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white, // 배경 색상 설정
                        borderRadius: BorderRadius.circular(10), // 테두리 둥글게 설정
                        border: Border.all(
                          color: Color(0xffF3F1EC), // 테두리 색상 설정
                          width: 2, // 테두리 두께 설정
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('입금/결제'),
                                SizedBox(height: 5),
                                Text('5'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('주문중'),
                                SizedBox(height: 5),
                                Text('2'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('주문완료'),
                                SizedBox(height: 5),
                                Text('3'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Color(0xffF0EADB)),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MyPurchasing()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text('결제/주문 내역',
                                style: TextStyle(
                                    fontFamily: 'Jua',
                                    fontSize: 20,
                                    color: Color(0xFF739072))),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF739072)),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Color(0xffF0EADB)),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlanteriorList(),
                ),
              );
            },
            child: Image.asset(
              'assets/banner/ad_planterior1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              // height: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}
