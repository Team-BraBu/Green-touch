import 'package:flutter/foundation.dart';

import '../product/plant_service.dart';

class Purchased {
  final String id;
  final Plant plant;

  Purchased({required this.id, required this.plant});
}

class ReviewService extends ChangeNotifier {
  Map<String, double> _ratings = {};

  Map<String, double> get ratings => _ratings;

  // List<Plant> reviews = [];

  List<Purchased> _purchasedItems = [];
  List<Purchased> get purchaseItems => _purchasedItems;

  void addPurchasedItems(List<Purchased> items) {
    _purchasedItems.addAll(items);
    notifyListeners();
  }

  void rateProduct(String productId, double rating) {
    _ratings[productId] = rating;
    notifyListeners();
  }

  double? getRating(String productId) {
    return _ratings[productId];
  }
}
