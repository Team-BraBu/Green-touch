import 'package:flutter/material.dart';

import '../list/history.dart';

class Activity {
  String date;
  String description;
  IconData iconData;

  Activity(
      {required this.date, required this.description, required this.iconData});
}

class ActivityModel with ChangeNotifier {
  final List<Activity> _activities = [];

  List<Activity> get activities => _activities;

  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }
}
