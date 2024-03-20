import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class OnBoarding extends StatelessWidget {
  final List<String> images = [
    'assets/images/onboards/onBoard0.png',
    'assets/images/onboards/onBoard3.png',
    'assets/images/onboards/onBoard4.png',
    'assets/images/onboards/onBoard5.png'
  ];

  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index == images.length - 1) {
            // 마지막 페이지인 경우
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 100, // 버튼을 이미지 하단에 위치시킴
                  left: 50, // 버튼을 이미지 좌측에 위치시킴
                  right: 50, // 버튼을 이미지 우측에 위치시킴
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼이 클릭되었을 때 수행할 동작 정의
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff739072),
                        fixedSize: Size(200, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      '식물 친구 찾기',
                      style: TextStyle(
                          color: Color(0xffece3ce),
                          fontFamily: 'Jua',
                          fontWeight: FontWeight.normal,
                          fontSize: 21),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // 마지막 페이지가 아닌 경우
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          }
        },
        itemCount: images.length,
        loop: true,
        // 마지막 슬라이드에서 다시 첫 번째 슬라이드로 돌아감
        pagination: SwiperPagination(),
        // 페이지 표시기 표시
        control: SwiperControl(color: Color(0xff739072)), // 이전 및 다음 버튼 표시
      ),
    );
  }
}
