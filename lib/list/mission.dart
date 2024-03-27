import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';

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
                      setState(() {
                        missions[index].isCompleted = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
