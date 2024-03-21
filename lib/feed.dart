import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.imagePath,
    required this.contentPath,
    required this.hashtagPath,
  });
  final String imagePath;
  final String contentPath;
  final String hashtagPath;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false;
  bool isMarked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          widget.imagePath,
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(CupertinoIcons.heart),
              color: isFavorite ? Colors.red : Colors.black,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    isMarked = !isMarked;
                  });
                },
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: isMarked ? Colors.grey : Colors.black,
                ))
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
            '2024년 03월 21일',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
