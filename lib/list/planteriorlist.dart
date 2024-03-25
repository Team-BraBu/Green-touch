import 'package:flutter/material.dart';
import 'package:greentouch/list/feed.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';

class PlanteriorList extends StatelessWidget {
  const PlanteriorList({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanteriorData planteriorData = PlanteriorData.defaultData;

    return Scaffold(
      appBar: BaseAppBar(),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: planteriorData.images.length,
        itemBuilder: (context, index) {
          final image = planteriorData.images[index];
          final content = planteriorData.contents[index];
          final hashtag = planteriorData.hashtags[index];
          final date = planteriorData.dates[index];
          return Feed(
            imagePath: image,
            contentPath: content,
            hashtagPath: hashtag,
            datePath: date,
          );
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
