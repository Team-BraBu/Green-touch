import 'package:flutter/material.dart';

import '../mypage/tab_cart.dart';

void main() {
  // 스플래시 위젯 적용
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 어플리케이션의 루트 위젯입니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: InformationDetail(),
    );
  }
}

class InformationDetail extends StatefulWidget {
  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  bool _isExpanded = false; // _isExpanded 상태 변수 추가
  //  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ↑구매버튼 누르면 창뜨는 메서드 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            scale: 4.5,
          ),
        ),
      ),

      //drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/plant/plant1.png',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const Divider(
              color: Color(0xffF0EADB),
              thickness: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.1, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22.9),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '그늘과 ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                        TextSpan(
                          text: '추위에도 잘 견디고, ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextSpan(
                          text: '병충해에 강한 초보 가드너에게',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextSpan(
                          text: ' 강추!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.20)),
                  const Divider(
                    color: Color(0xffF0EADB),
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.yellow[600],
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: Text(
                              'Hot',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            child: Text(
                              '한정수량',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '           29,000원',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            '2,500원 (50,000원 이상 무료배송)',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5.20)),
                  const Divider(
                    color: Color(0xffF0EADB),
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '식물 키우는 꿀팁',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF3A4D39),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? '접기' : '전체보기 >',
                          style: TextStyle(color: Colors.green[600]),
                        ),
                      ),
                    ],
                  ),

                  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 클릭시 내용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
                  SizedBox(height: 16),
                  if (_isExpanded) ...[
                    Text(
                      '그늘과 추위에도 잘 견디고, 병해충에도 강하기 때문에 초보자들에게 추천하는 실내식물이에요. 수경재배로 키울 수도 있어서 취향에 맞춰 키울 수 있습니다.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '주의 사항',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '- 햇볕이 너무 강하면 잎이 녹거나 말리는 경우가 있어요.\n- 물은 흙이 완전히 마르기 전에 주되, 흙이 너무 젖지 않게 주의해 주세요.\n- 겨울에는 물을 적게 주는 것이 좋습니다.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '키우기 팁',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '- 실내에서 키울 때는 밝은 곳에 두고, 햇빛이 너무 강하지 않게 주의해 주세요.\n- 흙이 말랐을 때 물을 주되, 너무 많이 주지 않도록 합니다.\n- 여름에는 주 1회 이상, 겨울에는 2주에 한 번 정도 물을 줍니다.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ], // 접기/펼쳐보기.
                  SizedBox(height: 16),
                  Text('추가 텍스트'),
                  Padding(padding: EdgeInsets.all(1.5)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8.5)),
            Divider(color: Colors.grey, thickness: 3),
          ],
        ),
      ),
      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ↑ 본문 내용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ클릭시 On New창 뜨는 부분! ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tabcart()));
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '선물 하기',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF739072),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Card(
                                elevation: 4,
                                child: ExpansionTile(
                                  title: Text(
                                    '식물이름',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: [
                                    ListTile(
                                      title: Text('목록'),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '구매창',
                              style: TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // 모달 닫기
                              },
                              child: Text('닫기'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                '바로 구매',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFECE3CE)),
            ),
          ],
        ),
      ),
    );
  }
}
