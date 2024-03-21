import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class information_detail extends StatefulWidget {
  const information_detail({super.key});

  @override
  State<information_detail> createState() => _information_detailState();
}

class _information_detailState extends State<information_detail> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('touch Green'),
        backgroundColor: Color(0xFF739072),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/images/plant.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.1, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.9),
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
                          text: '  강추!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.20)),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.yellow[600],
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 30.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Hit',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '29,000원',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Text(
                    '일반택배 >',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '식물 키우는 꿀팁',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF3A4D39)),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
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
              onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
