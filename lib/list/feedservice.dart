import 'package:flutter/cupertino.dart';
import 'package:greentouch/list/feed.dart';
import 'package:greentouch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * ChangeNotifier
 * 지정한 값이 변하게되면 해당 값을 보여주는 화면들을 갱신해주는 클래스
 * ChangeNotifier 를 상속하게 되면,notifylisteners() 를 호출하여, 위젯들을 갱신하는 기능
 */

class FeedService extends ChangeNotifier {
  SharedPreferences prefs;

  // // 리스트 이미지
  // List<String> pImages = [];
  // 북마크 누른 이미지
  List<String> savedImages = [];

  FeedService(this.prefs) {
    savedImages = prefs.getStringList('saved') ?? [];
  }

  void toggleSavedImage(String imagePath) {
    if (savedImages.contains(imagePath)) {
      savedImages.remove(imagePath);
    } else {
      savedImages.add(imagePath);
    }
    // Shared Preferences에 저장
    prefs.setStringList('saved', savedImages);
    notifyListeners();
  }
}
