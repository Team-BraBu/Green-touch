import 'package:flutter/cupertino.dart';

import '../product/plant_service.dart';
import '../service/cart_service.dart'; // CartService를 import 해야 함

class PurchaseService extends ChangeNotifier {
  List<Plant> _purchasedItems = [];
  final CartService _cartService; // CartService 필드 추가

  PurchaseService({required CartService cartService}) // 생성자 수정
      : _cartService = cartService; // CartService 할당

  List<Plant> get purchasedItems => _purchasedItems;

  void addPurchase(Plant plant) {
    _purchasedItems.add(plant);
    // CartService에서도 purchasedItems를 업데이트해야 할 경우, 여기에서 업데이트
    _cartService.addToCart(plant);
  }
}
