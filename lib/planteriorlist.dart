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
    return Scaffold(
        appBar: AppBar(
          actions: [Image.asset('assets/images/logo.png')],
        ),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return Feed(
              imagePath: image,
            );
          },
        )
        // GridView.count(
        //   crossAxisCount: 1,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 8,
        //   padding: EdgeInsets.all(8),
        //   children: [Feed()],
        // ),
        );
  }
}
