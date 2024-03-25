import 'package:flutter/material.dart';
import 'package:greentouch/list/planteriorlist.dart';
import 'package:greentouch/mypage/product_reviews.dart';
import 'package:greentouch/savedfeed.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';
import 'calendar.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
                CircleAvatar(
                  radius: 50,
                  // backgroundImage: AssetImage(''),
                  backgroundColor: Color(0xfff0eadb),
                ),
                SizedBox(width: 20),
                Text(
                  '최준영',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                        // // 버튼이 눌렸을 때 수행할 동작 추가
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => ProductReview(),
                        //   ),
                        // );
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
                        // 버튼이 눌렸을 때 수행할 동작 추가
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
                        // 버튼이 눌렸을 때 수행할 동작 추가
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => ProductReview(),
                        //   ),
                        // );
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
                        // 버튼이 눌렸을 때 수행할 동작 추가
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SavedFeedPage(),
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
                    Text(
                      '최근 주문',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('입금/결제'),
                              SizedBox(height: 5),
                              Text('0'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('주문중'),
                              SizedBox(height: 5),
                              Text('0'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('주문완료'),
                              SizedBox(height: 5),
                              Text('0'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    InkWell(
                      onTap: () {
                        // 결제/주문 내역을 눌렀을 때 동작할 코드 추가
                      },
                      child: Row(
                        children: [
                          Text(
                            '결제/주문 내역',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
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
