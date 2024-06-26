import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:greentouch/list/carculate_rating_bar.dart';
import 'package:greentouch/mypage/purchase.dart';
import 'package:greentouch/mypage/tab_cart.dart';
import 'package:greentouch/product/plant_service.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';
import '../service/cart_service.dart';

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
    final user = context.read<AuthService>().currentUser();

    // 별점 데이터 준비
    Map<int, int> ratings = {
      5: 20, // 예시: 5점 별점을 20회 받음
      4: 15,
      3: 5,
      2: 3,
      1: 2,
    };

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
                            '${widget.plant.title}의 특징 ',
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
                              _isExpanded ? '접기' : '정보 보기 >',
                              style: TextStyle(color: Colors.green[600]),
                            ),
                          ),
                        ],
                      ),
                      if (_isExpanded) ...[
                        Text(
                          widget.plant.detail_1,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 15),
                        ),
                        SizedBox(height: 16),
                        if (widget.plant.subtitle == '영양제')
                          Text(
                            '영양제 TIP',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xffD26F6F),
                              fontFamily: 'Jua',
                            ),
                          ),
                        if (widget.plant.subtitle == '영양제')
                          Text(
                            widget.plant.detail_2,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        if (widget.plant.subtitle != '영양제')
                          Text(
                            '키우는 TIP',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xffD26F6F),
                              fontFamily: 'Jua',
                            ),
                          ),
                        if (widget.plant.subtitle != '영양제')
                          Text(
                            widget.plant.detail_2,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        SizedBox(height: 25),
                        if (widget.plant.subtitle != '영양제')
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
                      Padding(padding: EdgeInsets.all(1.5)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.5)),

                //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 클릭시 내용 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
              ],
            ),
            Divider(
              height: 1,
            ),

            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '사용자 ⭐️ 평가',
                  style: TextStyle(
                      fontFamily: 'Jua',
                      fontSize: 20,
                      color: Color(0xff739072)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 20, left: 40, right: 40),

                  //  별점 차트 불러 오기
                  child: RatingBarChart(
                    ratings: ratings,
                  ),
                ),
              ],
            ),
            // ... 기타 상품 정보 및 설명 위젯들
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
            GestureDetector(
              onTap: () {
                if (user != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabCart()));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("회원 전용"),
                          content: Text('로그인이 된 회원만 장바구니를 이용할 수 있습니다.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('확인'))
                          ],
                        );
                      });
                }
              },
              child: Icon(
                CupertinoIcons.cart,
                size: 35,
                color: Color(0xFF739072),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (user != null) {
                  final cartItem = widget.plant;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            '장바구니',
                            style: TextStyle(
                                color: Color(0xff739072),
                                fontFamily: 'Jua',
                                fontSize: 15),
                          ),
                          content: Text(
                            '장바구니에 담으시겠습니까?',
                            style: TextStyle(
                              fontFamily: 'Jua',
                              fontSize: 25,
                              color: Color(0xff739072),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffece3ce),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                '둘러볼게요!',
                                style: TextStyle(
                                    color: Color(0xff739072),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Jua',
                                    fontSize: 15),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  context
                                      .read<CartService>()
                                      .addToCart(cartItem); // 장바구니에 상품 추가
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('장바구니에 추가되었습니다')),
                                  );
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff739072),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10))),
                                child: Text(
                                  '장바구니 담기',
                                  style: TextStyle(
                                      color: Color(0xffece3ce),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Jua',
                                      fontSize: 15),
                                ))
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("회원 전용"),
                          content: Text('로그인이 된 회원만 장바구니를 이용할 수 있습니다.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('확인'))
                          ],
                        );
                      });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF739072),
                fixedSize: Size(155, 55),
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
                      child: PurchaseModalButton(
                        title: widget.plant.title,
                        plant: widget.plant,
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFECE3CE),
                fixedSize: Size(155, 55),
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

//모달창 클래스
class PurchaseModalButton extends StatelessWidget {
  final String title;
  final Plant plant;

  const PurchaseModalButton(
      {Key? key, required this.title, required this.plant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  '"$title"를 바로 구매 하시겠습니까 ??',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    color: Color(0xff3A4D39),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // 모달 닫기
                    },
                    child: Text(
                      '닫기',
                      style: TextStyle(
                        color: Color(0xFF739072),
                        fontFamily: 'Jua',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF739072),
                      fixedSize: Size(320, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (user != null) {
                        final cartItem = plant;
                        context
                            .read<CartService>()
                            .addToCart(cartItem); // 장바구니에 상품 추가
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurchasePage()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("회원 전용"),
                                content: Text('로그인이 된 회원만 구매를 이용할 수 있습니다.'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'))
                                ],
                              );
                            });
                      }
                    },
                    child: Text(
                      '바로 구매 하기',
                      style: TextStyle(
                        color: Color(0xFFECE3CE),
                        fontFamily: 'Jua',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
