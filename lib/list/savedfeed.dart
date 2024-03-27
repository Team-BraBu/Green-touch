import 'package:flutter/material.dart';
import 'package:greentouch/main.dart';

class BookmarkedFeed extends StatefulWidget {
  const BookmarkedFeed({
    Key? key,
    required this.imagePath,
    required this.contentPath,
    required this.hashtagPath,
    required this.datePath,
    required this.isMarked,
    required this.onBookmarkChanged,
  }) : super(key: key);

  final String imagePath;
  final String contentPath;
  final String hashtagPath;
  final String datePath;
  final bool isMarked;
  final Function(bool) onBookmarkChanged;

  @override
  State<BookmarkedFeed> createState() => _BookmarkedFeedState();
}

class _BookmarkedFeedState extends State<BookmarkedFeed> {
  @override
  void initState() {
    super.initState();
  }

  void saveBookmarkStatus(bool isMarked) async {
    await prefs.setBool(widget.imagePath, isMarked);
    if (isMarked) {
      // 북마크 된 상태일 때, 피드 정보를 SharedPreferences에 저장
      await saveFeedInfo();
    } else {
      // 북마크가 해제된 경우 해당 피드 정보를 삭제
      await prefs.remove(widget.imagePath);
    }
  }

  // 북마크된 상태 불러오기
  Future<bool> loadBookmarkStatus() async {
    return prefs.getBool(widget.imagePath) ?? false;
  }

  // 피드 정보를 SharedPreferences에 저장
  Future<void> saveFeedInfo() async {
    await prefs.setString(widget.imagePath + '_image', widget.imagePath);
    await prefs.setString(widget.imagePath + '_content', widget.contentPath);
    await prefs.setString(widget.imagePath + '_hashtag', widget.hashtagPath);
    await prefs.setString(widget.imagePath + '_date', widget.datePath);
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: () {
            // isFavorite 로직 추가 가능
            isFavorite = !isFavorite;
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
                // isFavorite 로직 추가 가능
                isFavorite = !isFavorite;
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            Text('365 likes'),
            Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.onBookmarkChanged(!widget.isMarked);
                  saveBookmarkStatus(!widget.isMarked); // 북마크 상태 저장
                });
              },
              icon: Icon(
                widget.isMarked ? Icons.bookmark : Icons.bookmark_border,
                color: widget.isMarked ? Colors.black : Colors.black,
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
