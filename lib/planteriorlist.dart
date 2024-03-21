import 'package:flutter/material.dart';
import 'package:greentouch/feed.dart';

class PlanteriorList extends StatelessWidget {
  const PlanteriorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset('assets/images/logo.png')],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        children: [Feed()],
      ),
    );
  }
}
