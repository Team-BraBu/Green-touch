import 'package:flutter/foundation.dart';
import 'package:greentouch/service/purchased_service.dart';

import '../product/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;

  // PurchaseService 인스턴스에 접근
  PurchaseService _purchaseService;
  // CartService 생성자에서 PurchaseService 인스턴스 주입
  CartService(this._purchaseService);

  List<Plant> get purchasedItems => _purchaseService.purchasedItems;

  // 구매한 상품 목록을 반환하는 메서드
  List<Plant> getPurchaseItems() {
    return List<Plant>.from(purchasedItems);
  }

  void addToCart(Plant plant) {
    product.add(plant);
    notifyListeners();
  }

  void removeItems(Plant plant) {
    product.remove(plant); // 장바구니에서 삭제
    _purchaseService.addPurchase(plant); // 결제 후 삭제된 상품 목록에 추가
    notifyListeners();
  }

  void removeCartItems() {
    product.clear(); // 결제 후 카트에서 삭제
    notifyListeners();
  }
}
