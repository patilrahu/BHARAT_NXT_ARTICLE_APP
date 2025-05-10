import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constant/color_constant.dart';

class AppTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? isObsecure;
  final List<TextInputFormatter>? inputFormatters;
  String? errorText;
  int? maxLength;
  int? maxLines;
  Color? fillColor;
  double? borderRadius;
  TextInputAction? textInputAction;
  bool? isEnable = true;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  TextCapitalization? textCapitalization;
  AppTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onChanged,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.inputFormatters,
      this.fillColor,
      this.errorText = "",
      this.isObsecure = false,
      this.textCapitalization,
      this.borderRadius = 10,
      this.maxLines = 1,
      this.maxLength,
      this.onSubmitted,
      this.isEnable = true,
      this.textInputAction});

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 5, left: 5),
          //   child: AppText(
          //     text: widget.hintText,
          //     // color: HexColor(ColorConstant.greyBorderColor),
          //     fontSize: 12,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          TextField(
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            enabled: widget.isEnable,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            textInputAction: widget.textInputAction,
            onSubmitted: (value) {
              if (widget.onSubmitted != null) {
                widget.onSubmitted!(value);
              }
            },
            maxLines: widget.maxLines ?? 1,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            cursorColor: HexColor(ColorConstant.primaryColor),
            obscureText: widget.isObsecure ?? false,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: StringConstant.appFontFamily,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              counterText: "",
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontFamily: StringConstant.appFontFamily,
                  color: HexColor(ColorConstant.greyColor),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor(ColorConstant.greyColor)),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor(ColorConstant.greyColor)),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor(ColorConstant.greyColor)),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor(ColorConstant.greyColor)),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: HexColor(ColorConstant.greyColor)),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
            ),
          ),
          Visibility(
            visible: widget.errorText != "",
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 2),
              child: AppText(
                text: widget.errorText ?? "",
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
