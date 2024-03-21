import 'package:flutter/material.dart';

import '../main_Page.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFF739072),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
