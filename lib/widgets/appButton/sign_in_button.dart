import 'package:flutter/material.dart';
import 'package:tanghit/widgets/loader.dart';

class SignInButton extends StatelessWidget {
  SignInButton({
    @required this.bgColor,
    @required this.buttonText,
    @required this.onTapFunction,
    @required this.textColor,
    @required this.textFontSize,
    this.borderColor,
    this.borderRadius,
    this.showLoader = false,
  });

  final Color bgColor;
  final Color borderColor;
  final double borderRadius;
  final String buttonText;
  final Function onTapFunction;
  final bool showLoader;
  final Color textColor;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
        border: Border.all(color: borderColor ?? bgColor, width: 1.5),
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
              : SizedBox(child: Loader()),
        ),
      ),
    );
  }
}
