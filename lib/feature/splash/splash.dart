import 'package:bharat_nxt_article_app/constant/color_constant.dart';
import 'package:bharat_nxt_article_app/constant/image_constant.dart';
import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/feature/article/ui/articles.dart';
import 'package:bharat_nxt_article_app/widget/app_background.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const Articles()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstant.welcomeImage, height: 400, width: 400),
          AppText(
            text: StringConstant.splashText,
            fontSize: 29,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: HexColor(ColorConstant.primaryColor),
          ),
        ],
      ),
    ));
  }
}
