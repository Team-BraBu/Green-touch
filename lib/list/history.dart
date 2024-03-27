import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';

class HistoryPage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
      date: '2023-03-27',
      description: '햇빛 채우기 작업을 완료했습니다.',
      iconData: Icons.wb_sunny,
    ),
    Activity(
      date: '2023-03-26',
      description: '물주기 작업을 완료했습니다.',
      iconData: Icons.invert_colors,
    ),
    // 추가 활동 내역...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(
                activities[index].iconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(activities[index].date),
              subtitle: Text(activities[index].description),
            ),
          );
        },
      ),
    );
  }
}

class Activity {
  String date;
  String description;
  IconData iconData;

  Activity(
      {required this.date, required this.description, required this.iconData});
}
