import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/service/review_service.dart';
import 'package:uuid/uuid.dart';

import '../product/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;

  //ReviewService 인스턴스 주입
  final ReviewService reviewService;

  CartService(this.reviewService);

  void addToCart(Plant plant) {
    product.add(plant);
    notifyListeners();
  }

  void Function(List<Plant>)? onDataTransferred;

  void removeItems(Plant plant) {
    product.remove(plant); // 장바구니에서 삭제
    notifyListeners();
  }

  void removeCartItems() async {
    List<Purchased> purchased = product.map((plant) {
      return Purchased(
          id: Uuid().v4(), plant: plant, purchaseDate: DateTime.now()); //고유ID생성
    }).toList();

    print('product : $product');
    //reviewService로 구매 완료한 항목목록을 전송
    reviewService.addPurchasedItems(purchased);

    print('purchased : $purchased');
    // 카트에서의 목록을 지웁니다.
    product.clear();

    // 상태를 업데이트하기 위해 notifyListeners 호출
    notifyListeners();
  }
}
