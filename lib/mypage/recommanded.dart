import 'package:flutter/material.dart';
import 'package:greentouch/layout/appbar_back.dart';

class Recommand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BackAppbar(),
        body: PlantActivityPage(),
      ),
    );
  }
}

class PlantActivityPage extends StatelessWidget {
  final List<PlantActivity> plantActivities = [
    PlantActivity(
      title: '식물 물주기',
      description: '하루에 한 번씩 식물에게 물을 주세요.',
      iconData: Icons.local_drink,
      color: Colors.blue,
    ),
    PlantActivity(
      title: '햇빛 채우기',
      description: '식물이 충분한 햇빛을 받을 수 있도록 창가에 위치시키세요.',
      iconData: Icons.wb_sunny,
      color: Colors.orange,
    ),
    PlantActivity(
      title: '토양 교체하기',
      description: '식물의 토양을 교체하여 영양분을 공급하세요.',
      iconData: Icons.share_arrival_time,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plantActivities.length,
      itemBuilder: (context, index) {
        return PlantActivityTile(plantActivity: plantActivities[index]);
      },
    );
  }
}

class PlantActivity {
  final String title;
  final String description;
  final IconData iconData;
  final Color color;

  PlantActivity({
    required this.title,
    required this.description,
    required this.iconData,
    required this.color,
  });
}

class PlantActivityTile extends StatefulWidget {
  final PlantActivity plantActivity;

  const PlantActivityTile({Key? key, required this.plantActivity})
      : super(key: key);

  @override
  _PlantActivityTileState createState() => _PlantActivityTileState();
}

class _PlantActivityTileState extends State<PlantActivityTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return FadeTransition(
      opacity: _animation,
      child: ListTile(
        leading: Icon(
          widget.plantActivity.iconData,
          color: widget.plantActivity.color,
          size: 32,
        ),
        title: Text(
          widget.plantActivity.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.plantActivity.color,
          ),
        ),
        subtitle: Text(
          widget.plantActivity.description,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
