import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greentouch/main_Page.dart';
import 'package:greentouch/service/auth_service.dart';
import 'package:provider/provider.dart';
import '../mypage/tab_cart.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
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
            if (user != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TabCart()));
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("회원 전용"),
                      content: Text('로그인이 된 회원만 가능합니다.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('확인'))
                      ],
                    );
                  });
            }
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
          // scale: 1,
        ),
      ),
      centerTitle: true,
    );
  }
}
