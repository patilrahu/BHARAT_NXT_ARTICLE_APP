import 'package:bharat_nxt_article_app/constant/color_constant.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'app_loader.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool isDisable;

  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.borderRadius = 10,
      this.padding,
      this.isLoading = false,
      this.isDisable = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: color ?? HexColor(ColorConstant.primaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: isLoading
            ? const AppLoader(
                size: 25.0,
                strokeWidth: 3,
                color: Colors.white,
              )
            : AppText(
                text: text,
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
      ),
    );
  }
}
