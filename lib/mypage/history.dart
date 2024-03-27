import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:provider/provider.dart';

import '../service/activity_service.dart'; // ActivityModel 클래스 정의 파일

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<ActivityModel>(context).activities;

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
//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialActivities != null) {
//       activities.addAll(widget.initialActivities!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BackAppbar(),
//       body: ListView.builder(
//         itemCount: activities.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(8),
//             child: ListTile(
//               leading: Icon(
//                 activities[index].iconData,
//                 color: Theme.of(context).primaryColor,
//               ),
//               title: Text(activities[index].date),
//               subtitle: Text(activities[index].description),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Activity {
//   String date;
//   String description;
//   IconData iconData;
//
//   Activity(
//       {required this.date, required this.description, required this.iconData});
// }
