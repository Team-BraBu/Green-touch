import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../product/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;

  void Function(List<Plant>)? onDataTransferred;

  void addToCart(Plant plant) {
    product.add(plant);
    notifyListeners();
  }

  void removeItems(Plant plant) {
    product.remove(plant); // 장바구니에서 삭제

    notifyListeners();
  }

  void removeCartItems() {
    // 카트에서의 목록을 전달하기 위해 콜백 함수 호출
    onDataTransferred?.call(product);
    // 카트에서의 목록을 지웁니다.
    product.clear();

    // 상태를 업데이트하기 위해 notifyListeners 호출
    notifyListeners();
  }
}
