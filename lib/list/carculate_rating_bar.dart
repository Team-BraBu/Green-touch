import 'package:flutter/material.dart';

// RatingBarChart 위젯 정의
class RatingBarChart extends StatelessWidget {
  // 별점 데이터를 받을 변수 선언
  final Map<int, int> ratings;

  // 생성자를 통해 별점 데이터를 위젯에 전달
  const RatingBarChart({Key? key, required this.ratings}) : super(key: key);

  // 별점 데이터로부터 별점별 비율을 계산하는 정적 메소드
  static Map<int, double> calculateRatingPercentage(Map<int, int> ratings) {
    // 전체 별점의 수를 계산
    final totalRatings =
        ratings.values.fold(0, (sum, count) => sum + count).toDouble();
    // 각 별점별 비율을 계산하여 Map으로 반환
    return ratings.map((rating, count) {
      return MapEntry(rating, count / totalRatings);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 별점 데이터로부터 별점별 비율을 계산
    final ratingPercentage = calculateRatingPercentage(ratings);

    return Column(
      // 각 별점별로 위젯을 동적으로 생성
      children: ratingPercentage.keys.toList().reversed.map((rating) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 별점 표시 (예: "5 stars: ")
              Text(
                '$rating stars: ',
              ),
              SizedBox(
                width: 30,
              ),
              // 별점 비율을 나타내는 선형 진행 표시줄
              Expanded(
                child: LinearProgressIndicator(
                  value: ratingPercentage[rating], // 별점 비율
                  backgroundColor: Colors.grey[300], // 배경색
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  minHeight: 7, // 진행 표시줄 색상
                ),
              ),
              SizedBox(
                width: 20,
              ),
              // 별점 비율을 퍼센트로 표시 (예: "40%")
              Text('${(ratingPercentage[rating]! * 100).toStringAsFixed(1)}%'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
