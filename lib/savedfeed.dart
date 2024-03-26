import 'package:flutter/material.dart';
import 'package:greentouch/layout/app_drawer.dart';
import 'package:greentouch/layout/appbar.dart';
import 'package:greentouch/list/feed.dart';
import 'package:greentouch/list/feedservice.dart';
import 'package:provider/provider.dart';

class SavedFeedPage extends StatelessWidget {
  const SavedFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedService = Provider.of<FeedService>(context);
    final savedImages = feedService.savedImages;

    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: savedImages.length,
        itemBuilder: (context, index) {
          final savedImage = savedImages[index];
          return Feed(
              imagePath: savedImage,
              contentPath: '1',
              hashtagPath: '2',
              datePath: '3');
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SavedFeedPage extends StatefulWidget {
//   // const SavedFeedPage({Key? key}) : super(key: key);
//
//   const SavedFeedPage({
//     Key? key,
//     required this.imagePath,
//     required this.contentPath,
//     required this.hashtagPath,
//     required this.datePath,
//   }) : super(key: key);
//
//   final String imagePath;
//   final String contentPath;
//   final String hashtagPath;
//   final String datePath;
//
//   @override
//   State<SavedFeedPage> createState() => _SavedFeedPageState();
// }
//
// class _SavedFeedPageState extends State<SavedFeedPage> {
//   bool isFavorite = false;
//   bool isMarked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onDoubleTap: () {
//             setState(() {
//               isFavorite = !isFavorite;
//             });
//           },
//           child: Image.asset(
//             widget.imagePath,
//             height: 400,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isFavorite = !isFavorite;
//                 });
//               },
//               icon: Icon(
//                 isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: isFavorite ? Colors.red : Colors.black,
//               ),
//             ),
//             Text('365 likes'),
//             Spacer(),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isMarked = !isMarked;
//                   // _savedFeed();
//                 });
//               },
//               icon: Icon(
//                 isMarked ? Icons.bookmark : Icons.bookmark_border,
//                 color: isMarked ? Colors.black : Colors.black,
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             widget.contentPath,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             widget.hashtagPath,
//             style: TextStyle(color: Colors.blueAccent),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             widget.datePath,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         SizedBox(
//           height: 8,
//         )
//       ],
//     );
//   }
// }
