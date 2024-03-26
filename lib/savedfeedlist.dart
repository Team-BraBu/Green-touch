import 'package:flutter/material.dart';
import 'package:greentouch/list/feed.dart';
import 'package:greentouch/list/feed_item.dart';
import 'package:greentouch/list/feedservice.dart';
import 'package:greentouch/savedfeed.dart';
import 'package:provider/provider.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';

class SavedFeedList extends StatelessWidget {
  const SavedFeedList({super.key});

  @override
  Widget build(BuildContext context) {
    var feedService = Provider.of<FeedService>(context);
    List<Feed> bookmarkedFeeds = feedService.bookmarkedFeeds;

    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: bookmarkedFeeds.length,
        itemBuilder: (context, index) {
          return FeedItem(imagePath: bookmarkedFeeds[index], contentPath: contentPath, hashtagPath: hashtagPath, datePath: datePath)
          // final image = planteriorData.images[index];
          // final content = planteriorData.contents[index];
          // final hashtag = planteriorData.hashtags[index];
          // final date = planteriorData.dates[index];
          // return BookmarkedFeed(
          //   imagePath: image,
          //   contentPath: content,
          //   hashtagPath: hashtag,
          //   datePath: date,
          //   isMarked: planteriorData.isFeedMarked(index),
          //   onBookmarkChanged: (isMarked) {
          //     planteriorData.toggleFeedMarked(index, isMarked);
          //   },
          // );
        },
      ),
    );
  }
}

class PlanteriorData {
  final List<String> images;
  final List<String> contents;
  final List<String> hashtags;
  final List<String> dates;

  PlanteriorData(
      {required this.images,
      required this.contents,
      required this.hashtags,
      required this.dates});

  static PlanteriorData get defaultData => PlanteriorData(
        images: [
          'assets/images/planterior1.png',
          'assets/images/planterior2.png',
        ],
        contents: [
          '식물과 함께하는 인테리어 어떠세요?',
          '이제는 나도 식집사!',
        ],
        hashtags: [
          '#플랜테리어 #식물 #초보자가_키우기_쉬운_식물',
          '#식집사 #식물 #공기정화_식물',
        ],
        dates: [
          '2024년 03월 01일',
          '2024년 03월 02일',
        ],
      );
}
