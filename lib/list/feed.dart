import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imagePath,
    required this.contentPath,
    required this.hashtagPath,
    required this.datePath,
  }) : super(key: key);

  final String imagePath;
  final String contentPath;
  final String hashtagPath;
  final String datePath;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false;
  bool isMarked = false;
  late FeedIconState feedIconState;
  int likesCount = 356;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      feedIconState = FeedIconState(prefs);

      bool bookmarkStatus = feedIconState.loadBookmarkStatus(widget.imagePath);
      setState(() {
        isMarked = bookmarkStatus;
      });

      bool favoriteStatus =
          feedIconState.loadFavoriteStatus('favorite_${widget.imagePath}');
      setState(() {
        isFavorite = favoriteStatus;
      });

      int savedLikesCount =
          feedIconState.loadLikesCount('likes_${widget.imagePath}');
      setState(() {
        likesCount = savedLikesCount;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isFavorite = !isFavorite;
              // likesCount += 1; // 단순히 횟수 증가하는 로직
              likesCount += isFavorite ? 1 : -1; // 좋아요 누를때마다 횟수 조정
            });
            feedIconState.saveFavoriteStatus(
                'favorite_${widget.imagePath}', isFavorite);
            feedIconState.saveLikesCount(
                'likes_${widget.imagePath}', likesCount);
          },
          child: Image.asset(
            widget.imagePath,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  // likesCount += 1; // 단순히 횟수 증가하는 로직
                  likesCount += isFavorite ? 1 : -1; // 좋아요 누를때마다 횟수 조정
                });
                feedIconState.saveFavoriteStatus(
                    'favorite_${widget.imagePath}', isFavorite);
                feedIconState.saveLikesCount(
                    'likes_${widget.imagePath}', likesCount);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            ),
            Text('${likesCount} likes'),
            Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  isMarked = !isMarked;
                });
                feedIconState.saveBookmarkStatus(
                    widget.imagePath, isMarked); // 북마크 상태 저장
              },
              icon: Icon(
                isMarked ? Icons.bookmark : Icons.bookmark_border,
                color: isMarked ? Colors.black : Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(widget.contentPath),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.hashtagPath,
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.datePath,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}

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
