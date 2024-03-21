import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_Page.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.bars,
          color: Color(0xFF739072),
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFF739072),
            size: 35,
          ),
          onPressed: () {},
        ),
      ],
      title: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
        scale: 4.5,
      ),
      centerTitle: true,
    );
  }
}
