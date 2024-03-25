// import 'package:flutter/cupertino.dart';
// import 'package:greentouch/main.dart';
//
// class FeedService extends ChangeNotifier {
//   List<Map<String, String>> feeds = [];
//   List<String> feedsInfo = [];
//
//   List<Map<String, String>> savedFeeds = [];
//   List<String> savedfeedsInfo = [];
//
//   FeedService(prefs) {
//     savedFeeds = prefs.getStringList('saved') ?? [];
//   }
//
//   void toggleSavedFeeds(String feeds) {
//     if (savedFeeds.contains(feeds)) {
//       savedFeeds.remove(feeds);
//     } else {
//       savedFeeds.add(feeds);
//     }
//     notifyListeners();
//     prefs.setStringList('saved', savedFeeds);
//   }
// }
