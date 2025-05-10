import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/feature/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstant.appName,
      theme: ThemeData(fontFamily: StringConstant.appFontFamily),
      home: const Splash(),
    );
  }
}
