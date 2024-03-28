import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/service/review_service.dart';
import 'package:uuid/uuid.dart';

import '../mypage/tab_cart.dart';
import '../product/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;
  List<Product> _items = []; // 장바구니 아이템 목록
  List<Product> get items => _items;

  //ReviewService 인스턴스 주입
  final ReviewService reviewService;

  CartService(this.reviewService);

  void addToCart(Plant plant) {
    // 이미 장바구니에 있는지 확인
    bool alreadyInCart = product.contains(plant);

    if (alreadyInCart) {
      // 이미 장바구니에 있는 경우 수량을 증가시킴
      for (Plant p in product) {
        if (p == plant) {
          p.quantity++; // 수량 증가
          break;
        }
      }
    } else {
      // 장바구니에 없는 경우에는 새로 추가
      plant.quantity = 1; // 수량 초기화
      product.add(plant); // 상품 추가
    }

    notifyListeners(); // 상태 변경 알림
  }

  void addItem(Product product) {
    _items.add(product); // 아이템을 장바구니에 추가
    notifyListeners(); // 리스너에게 변경을 알림
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
