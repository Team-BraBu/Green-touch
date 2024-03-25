import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:greentouch/product/plant_service.dart';
import 'package:provider/provider.dart';

class InformationDetail extends StatefulWidget {
  final Plant plant; //선택된 식물을 인자로 받음

  InformationDetail({required this.plant}); //생성자에서 선택된 식물을 받음

  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  bool _isExpanded = false; // _isExpanded 상태 변수 추가
  //  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ↑구매버튼 누르면 창뜨는 메서드 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(),

      //drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              widget.plant.imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.plant.title,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Jua',
                        color: Color(0xff739072)),
                  ),
                ),
                const Divider(
                  color: Color(0xffF0EADB),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.yellow[600],
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Text(
                            'Hot',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      ClipRRect(
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
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.plant.price}  원',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2,500원 (50,000원 이상 무료배송)',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xffF0EADB),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.plant.title}의 특징 및 정보',
                            style: TextStyle(
                              fontFamily: 'Jua',
                              fontSize: 22,
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
                      if (_isExpanded) ...[
                        Text(
                          widget.plant.detail_1,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '키우는 TIP',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffD26F6F),
                            fontFamily: 'Jua',
                          ),
                        ),
                        Text(
                          widget.plant.detail_2,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '인테리어 TIP',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Jua',
                            color: Color(0xff739072),
                          ),
                        ),
                        Text(
                          widget.plant.detail_3,
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
                //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 클릭시 내용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
              ],
            ),
          ],
        ),
      ),

      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ↑ 본문 내용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ클릭시 On New창 뜨는 부분! ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF739072),
                fixedSize: Size(180, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                '장바구니 담기',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color(0xffECE3CE),
                    fontFamily: 'Jua'),
              ),
            ),
            SizedBox(
              width: 10,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFECE3CE),
                fixedSize: Size(180, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                '바로 구매',
                style: TextStyle(
                  fontFamily: 'Jua',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff3A4D39),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
