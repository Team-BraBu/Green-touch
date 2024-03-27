import 'package:shared_preferences/shared_preferences.dart';

class FeedIconState {
  final SharedPreferences prefs;

  FeedIconState(this.prefs);

  Future<void> saveBookmarkStatus(String imagePath, bool isMarked) async {
    await prefs.setBool(imagePath, isMarked);
  }

  bool loadBookmarkStatus(String imagePath) {
    return prefs.getBool(imagePath) ?? false;
  }

  Future<void> saveFavoriteStatus(String imagePath, bool isFavorite) async {
    await prefs.setBool('favorite_$imagePath', isFavorite);
  }

  bool loadFavoriteStatus(String imagePath) {
    return prefs.getBool('favorite_$imagePath') ?? false;
  }

  Future<void> saveLikesCount(String imagePath, int likesCount) async {
    await prefs.setInt('likes_$imagePath', likesCount);
  }

  int loadLikesCount(String imagePath) {
    return prefs.getInt('likes_$imagePath') ?? 356;
  }
}
