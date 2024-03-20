import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class information_detail extends StatelessWidget {
  //const information_detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '공기정화식물',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,

        // body: GridView.count(
        //   crossAxisCount: 2,
        //   mainAxisSpacing: 8,
        //   crossAxisSpacing: 8,
        //   padding: EdgeInsets.all(8),
        //   children: List.generate(10, (index) {}),
        // ));
      ),
    );
  }
}
