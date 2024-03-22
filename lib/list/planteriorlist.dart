import 'package:flutter/material.dart';
import 'package:greentouch/list/feed.dart';

import '../layout/app_drawer.dart';
import '../layout/appbar.dart';

class PlanteriorList extends StatelessWidget {
  const PlanteriorList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/planterior1.png',
      'assets/images/planterior2.png'
    ];

    final List<String> contents = [
      '식물과 함께하는 인테리어 어떠세요?',
      '이제는 나도 식집사!',
    ];

    final List<String> hashtags = [
      '#플랜테리어 #식물 #초보자가_키우기_쉬운_식물',
      '#식집사 #식물 #공기정화_식물',
    ];

    final List<String> dates = [
      '2024년 03월 01일',
      '2024년 03월 02일',
    ];

    return Scaffold(
        appBar: BaseAppBar(),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            final content = contents[index];
            final hashtag = hashtags[index];
            final date = dates[index];
            return Feed(
              imagePath: image,
              contentPath: content,
              hashtagPath: hashtag,
              datePath: date,
            );
          },
        ));
  }
}
