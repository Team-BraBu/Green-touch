import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../product/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;

  List<Plant> purchasedItems = []; // 구매한 목록을 저장하는 리스트

  void addToCart(Plant plant) {
    product.add(plant);
    notifyListeners();
  }

  void removeItems(Plant plant) {
    product.remove(plant);
    notifyListeners();
  }

  void removeCartItems() {
    product.clear();
    notifyListeners();
  }

  // 제품을 구매한 목록에 추가하는 메서드
  List<Plant> getPurchasedItem() {
    return purchasedItems;
  }
}
