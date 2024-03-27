import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';
import 'package:intl/intl.dart'; // DateFormat를 포함한 intl 패키지를 임포트합니다.
import 'package:provider/provider.dart';

import '../service/activity_service.dart';
import 'history.dart';

class MissionPage extends StatefulWidget {
  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  List<Mission> missions = [
    Mission(
        title: "햇빛을 보고싶어해요",
        description: "햇볕이 필요한 식물은 그늘이 아닌 햇빛아래 비치해주세요.",
        iconData: Icons.sunny_snowing),
    Mission(
        title: "습식식물은",
        description: "하루에 물 1번씩 물주기 잊지말아요~!",
        iconData: Icons.local_drink),
    Mission(
        title: "기록하는 습관! 잊지말아요!",
        description: "아이들의 상태를 기록해주세요.",
        iconData: Icons.book),
  ];
  //미션연동위한 코드 ↓
  void completeMission(int index, bool? isCompleted) {
    if (isCompleted ?? false) {
      final activity = Activity(
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        description: missions[index].description,
        iconData: missions[index].iconData,
      );
      // Provider를 사용하여 ActivityModel에 접근하고 활동을 추가합니다.
      Provider.of<ActivityModel>(context, listen: false).addActivity(activity);
    }
  }

  // 여기서 HistoryPage 생성자에 activity를 전달하려면 HistoryPage도 수정 필요

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(),
      body: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 40, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘의 미션',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Jua',
                color: Color(0xff739072),
              ),
            ),
            SizedBox(width: 30, height: 20), // 제목과 리스트 사이 여백 조절
            Expanded(
              child: ListView.builder(
                itemCount: missions.length,
                itemBuilder: (context, index) {
                  return MissionTile(
                      mission: missions[index],
                      onChanged: (bool? value) {
                        completeMission(
                            index, value); // 수정: 여기서 completeMission 호출
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//미션완료시 activity생성. 새로추가

class MissionTile extends StatelessWidget {
  final Mission mission;
  final ValueChanged<bool?> onChanged;

  const MissionTile({required this.mission, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        mission.iconData,
        color: mission.isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(mission.title),
      subtitle: Text(mission.description),
      trailing: Checkbox(
        value: mission.isCompleted,
        onChanged: onChanged,
        activeColor: Colors.green,
      ),
    );
  }
}

class Mission {
  String title;
  String description;
  IconData iconData;
  bool isCompleted;

  Mission({
    required this.title,
    required this.description,
    required this.iconData,
    this.isCompleted = false,
  });
}