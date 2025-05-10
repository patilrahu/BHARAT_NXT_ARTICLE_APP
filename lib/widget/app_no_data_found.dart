import 'package:bharat_nxt_article_app/constant/image_constant.dart';
import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/widget/app_button.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';

Widget noSearchDataFoundWidget(VoidCallback onPressed) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstant.noResultImage, height: 200, width: 200),
          const SizedBox(
            height: 10,
          ),
          AppText(
            text: StringConstant.noDataText,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
            child: AppButton(text: 'Retry', onPressed: onPressed),
          )
        ],
      ),
    ),
  );
}
