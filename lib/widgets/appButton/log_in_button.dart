import 'package:flutter/material.dart';
import 'package:tanghit/services/screen_ratio.dart';
import 'package:tanghit/widgets/loader.dart';

import '../../services/screen_ratio.dart';
const Color textcol = Color(0XFF1DA6AD);

class LogInButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Color bgColor;
  final Color textColor;
  final double textFontSize;
  final Function onTapFunction;
  final Color borderColor;
  final double borderRadius;
  final bool showLoader;

  LogInButton({
    this.buttonText = "Log In",
    this.width = 146,
    this.height =48,
    this.bgColor = Colors.white,
    this.textColor = textcol,
    this.textFontSize = 22,
    this.onTapFunction,
    this.borderColor,
    this.borderRadius,
    this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
            borderRadius ?? 40.0 ),
        border: Border.all(
            color: borderColor != null ? borderColor : bgColor, width: 1.5),
      ),
      child: InkWell(
        onTap: !showLoader ? onTapFunction : null,
        child: Center(
          child: !showLoader
              ? Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: textColor,
              fontSize: textFontSize,
            ),
          )
              : SizedBox(
              child: Loader(), height: height - 10, width: height - 10),
        ),
      ),
    );
  }
}
