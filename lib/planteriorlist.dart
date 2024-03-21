import 'package:flutter/material.dart';
import 'package:greentouch/feed.dart';

class PlanteriorList extends StatelessWidget {
  const PlanteriorList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/planterior1.png',
      'assets/images/planterior2.png'
    ];

    final List<String> contents = ['식물과 함께하는 인테리어 어떠세요?', '이제는 나도 식집사!'];

    return Scaffold(
        appBar: AppBar(
          actions: [Image.asset('assets/images/logo.png')],
        ),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            final content = contents[index];
            return Feed(
              imagePath: image,
              contentPath: content,
            );
          },
        ));
  }
}
