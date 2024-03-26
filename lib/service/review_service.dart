// 데이터 모델 정의
import 'package:flutter/cupertino.dart';

class PlantReviewService extends ChangeNotifier {
  final String name;
  final String imagePath;
  double rating;

  PlantReviewService(this.name, this.imagePath, {this.rating = 0});

  void updateRating(double newRating) {
    rating = newRating;
    notifyListeners(); // 상태 변경을 위해 notifyListeners() 호출
  }
}
