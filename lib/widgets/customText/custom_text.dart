import 'package:flutter/material.dart';
import 'package:tanghit/utils/constants/font_constants.dart';

class CustomText extends StatelessWidget {
  final String customText;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign align;
  final int maxLines;
  final TextOverflow overFlow;
  final double height;

  CustomText(
      {@required this.customText,
        this.textColor = Colors.white,
        this.fontSize = 19.0,
        this.fontFamily = Fonts.defaultFont,
        this.fontWeight = FontWeight.bold,
        this.align,
        this.maxLines,
        this.overFlow,
        this.height,
        Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      textAlign: align,
      overflow: overFlow ?? TextOverflow.clip,
      maxLines: maxLines ?? 10,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          height: height),
    );
  }
}
