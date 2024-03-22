import 'package:flutter/material.dart';
import 'package:greentouch/mypage/product_reviews.dart';
import 'calendar.dart';
import '../layout/app_drawer.dart';
import '../layout/appbar.dart';

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
                  backgroundImage: AssetImage(''),
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
            dividerColor: Color(0xfff0eadb),
            tabs: [
              Tab(
                child: Text(
                  '활동',
                  style: TextStyle(
                    fontSize: 20, // 원하는 크기로 조정
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '쇼핑',
                  style: TextStyle(
                    fontSize: 20, // 원하는 크기로 조정
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // 활동 탭 내용
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // 추천 활동을 눌렀을 때 동작할 코드 추가
                        },
                        child: Row(
                          children: [
                            Text(
                              '추천 활동',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      SizedBox(height: 65),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductReview(),
                            ),
                          ); // 후기 작성을 눌렀을 때 동작할 코드 추가
                        },
                        child: Row(
                          children: [
                            Text(
                              '후기 작성',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      SizedBox(height: 65),
                      InkWell(
                        onTap: () {
                          // 후기 작성을 눌렀을 때 동작할 코드 추가
                        },
                        child: Row(
                          children: [
                            Text(
                              '오늘의 미션',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      SizedBox(height: 65),
                      InkWell(
                        onTap: () {
                          // 후기 작성을 눌렀을 때 동작할 코드 추가
                        },
                        child: Row(
                          children: [
                            Text(
                              '내 활동 내역',
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
                  // 쇼핑 탭 내용
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '최근 주문',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}
