import 'package:flutter/cupertino.dart';
import 'package:greentouch/service/plant_service.dart';

class CartService extends ChangeNotifier {
  List<Plant> product = [];
  List<Plant> get plant => product;

  void addToCart(Plant plant) {
    product.add(plant);
    notifyListeners();
  }

  void removeItems(Plant plant) {
    product.remove(plant);
    notifyListeners();
  }
}
