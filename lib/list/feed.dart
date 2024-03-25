import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isFavorite = !isFavorite;
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
                  // _savedFeed();
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
