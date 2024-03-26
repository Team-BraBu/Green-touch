import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greentouch/list/feedservice.dart';
import 'package:greentouch/main.dart';
import 'package:provider/provider.dart';
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

  // SharedPreferences 를 사용하여 북마크된 상태 저장
  void saveBookmarkStatus(bool isMarked) async {
    await prefs.setBool(widget.imagePath, isMarked);
  }

  // SharedPreferences 에서 북마크된 상태 불러오기
  Future<bool> loadBookmarkStatus() async {
    return prefs.getBool(widget.imagePath) ?? false;
  }

  @override
  void initState() {
    loadBookmarkStatus().then((status) {
      setState(() {
        isMarked = status;
        // isFavorite = status;
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
              // saveFavoriteStatus(isFavorite);
            });
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
                  // saveFavoriteStatus(isFavorite);
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            ),
            Text('365 likes'),
            Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  isMarked = !isMarked;
                  saveBookmarkStatus(isMarked); // 북마크 상태 저장
                });
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
