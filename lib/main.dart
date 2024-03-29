import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:greentouch/onboarding.dart';
import 'package:greentouch/product/plant_service.dart';
import 'package:greentouch/service/activity_service.dart';
import 'package:greentouch/service/auth_service.dart';
import 'package:greentouch/service/cart_service.dart';
import 'package:greentouch/service/review_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_Page.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  FlutterNativeSplash.remove();

  runApp(
    //서비스 등록
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReviewService()),
        ChangeNotifierProvider(create: (context) => PlantService()), // 외우기
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(
            create: (context) => CartService(
                Provider.of<ReviewService>(context, listen: false))),

        ChangeNotifierProvider(
          create: (context) => ActivityModel(), //내정보-미션위해서 27일새로생성, 재형
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SharedPreferences 에서 온보딩 완료 여부 조회
    // isOnboarded 에 해당하는 값에서 null을 반환하는 경우 false를 기본값으로 지정.
    bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App Title',
        home: isOnboarded ? MainPage() : OnBoarding()
        // home: OnBoarding(),
        );
  }
}
