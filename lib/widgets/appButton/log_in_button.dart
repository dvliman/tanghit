import 'package:flutter/material.dart';
import 'package:tanghit/widgets/loader.dart';

const Color textcol = Color(0XFF1DA6AD);

class LogInButton extends StatelessWidget {
  final Widget buttonText;
  final double width;
  final double height;
  final double elevation;
  final Color bgColor;
  final Color textColor;
  final double textFontSize;
  final Function onTapFunction;
  final Color borderColor;
  final double borderRadius;
  final bool showLoader;


  LogInButton({
    this.buttonText,
    this.width,
    this.height,
    this.bgColor = Colors.white,
    this.textColor = textcol,
    this.textFontSize = 5,
    this.onTapFunction,
    this.elevation,
    this.borderColor,
    this.borderRadius,
    this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      elevation: 10,
      child: Container(
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
                ? buttonText
                : SizedBox(
                child: Loader(), height: height - 10, width: height - 10),
          ),
        ),
      ),
    );
  }
}
