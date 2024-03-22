import 'package:flutter/material.dart';
import 'calendar.dart';
import 'layout/appbar.dart';

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/minions.jpg'),
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
                      icon: Icon(Icons.calendar_month_outlined),
                      iconSize: 90,
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
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),
            TabBar(
              controller: _tabController,
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
                          // 후기 작성을 눌렀을 때 동작할 코드 추가
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
          ],
        ),
      ),
    );
  }
}
