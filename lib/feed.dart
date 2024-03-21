import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

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
        Expanded(
          child: Image.asset(
            'assets/images/planterior1.png',
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
                icon: Icon(CupertinoIcons.bookmark))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('플랜테리어 짱'),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text('#플랜테리어 #식물 #초보자가_키우기_쉬운_식물'),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            '2024년 03월 21일',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
