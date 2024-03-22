import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/main_Page.dart';
import '../tab_cart.dart';

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
          // leading 아이콘 버튼을 눌렀을 때 Drawer를 열도록 함
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFF739072),
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tabcart()),
            );
          },
        ),
      ],
      title: GestureDetector(
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
          scale: 4.5,
        ),

      ),
      centerTitle: true,
    );
  }
}
