import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_Page.dart';

class BackAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.chevron_back,
          color: Color(0xFF739072),
          size: 40,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
