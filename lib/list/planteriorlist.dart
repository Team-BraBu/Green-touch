import 'package:flutter/material.dart';
import 'package:greentouch/list/feed.dart';
import 'package:greentouch/list/planteriordata.dart';

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
