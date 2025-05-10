import 'package:bharat_nxt_article_app/constant/color_constant.dart';
import 'package:bharat_nxt_article_app/constant/image_constant.dart';
import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppLoader extends StatelessWidget {
  final double? size;
  final Color? color;
  final double strokeWidth;

  const AppLoader({
    super.key,
    this.size,
    this.color,
    this.strokeWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color ?? HexColor(ColorConstant.primaryColor),
        strokeWidth: strokeWidth,
      ),
    );
  }
}

Widget appLoadingPage() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.loadingImage,
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            text: StringConstant.loadingText,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: HexColor(ColorConstant.secondaryColor),
          )
        ],
      ),
    ),
  );
}
