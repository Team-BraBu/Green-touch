import 'package:flutter/material.dart';
import 'package:greentouch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedFeedPage extends StatefulWidget {
  const SavedFeedPage({Key? key}) : super(key: key);

  @override
  State<SavedFeedPage> createState() => _SavedFeedPageState();
}

class _SavedFeedPageState extends State<SavedFeedPage> {
  List<Map<String, String>> savedFeeds = [];

  @override
  void initState() {
    super.initState();
    _loadSavedFeeds();
  }

  Future<void> _loadSavedFeeds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedImagePaths = prefs.getStringList('imagePaths');
    List<String>? savedContentPaths = prefs.getStringList('contentPaths');
    List<String>? savedHashtagPaths = prefs.getStringList('hashtagPaths');
    List<String>? savedDatePaths = prefs.getStringList('datePaths');

    if (savedImagePaths != null &&
        savedContentPaths != null &&
        savedHashtagPaths != null &&
        savedDatePaths != null) {
      for (int i = 0; i < savedImagePaths.length; i++) {
        savedFeeds.add({
          'imagePath': savedImagePaths[i],
          'contentPath': savedContentPaths[i],
          'hashtagPath': savedHashtagPaths[i],
          'datePath': savedDatePaths[i],
        });
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Feed'),
      ),
      body: ListView.builder(
        itemCount: savedFeeds.length,
        itemBuilder: (context, index) {
          return _buildFeedItem(savedFeeds[index]);
        },
      ),
    );
  }

  Widget _buildFeedItem(Map<String, String> feed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Handle image tap
          },
          child: Image.asset(
            feed['imagePath']!,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                // Handle favorite button tap
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            Text('5 likes'),
            Spacer(),
            IconButton(
              onPressed: () {
                // Handle bookmark button tap
              },
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(feed['contentPath']!),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            feed['hashtagPath']!,
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            feed['datePath']!,
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
