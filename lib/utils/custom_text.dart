import 'package:flutter/material.dart';
import 'package:tanghit/utils/constants/font_constants.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {@required this.customText,
      this.textColor = Colors.white,
      this.fontSize = 19.0,
      this.fontFamily = Fonts.defaultFont,
      this.fontWeight = FontWeight.bold,
      this.align,
      this.height,
      Key key})
      : super(key: key);

  final TextAlign align;
  final String customText;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      textAlign: align,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          height: height),
    );
  }
}
