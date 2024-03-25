import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/product/plant_service.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;

  const ProductListItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imagePath,
                  height: 150, // 이미지 높이 조절
                  width: double.infinity, // 이미지 너비를 화면에 꽉 차도록 설정
                  fit: BoxFit.fill, // 이미지를 꽉 채우도록 설정
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF3A4D39),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Color(0xFF3A4D39)),
              ),
              Text(
                price,
                style: TextStyle(color: Color(0xFF3A4D39)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
