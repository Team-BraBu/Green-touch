import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.white,
            ),
            accountName: Text('ruah0807'),
            accountEmail: Text('kimhk0315@gmail.com'),
            onDetailsPressed: () {
              print('Header is clicked');
            },
            decoration: BoxDecoration(
              color: Color(0xFF739072),
            ),
          ),
        ],
      ),
    );
  }
}
