import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanghit/services/screen_ratio.dart';

class CustomTextField extends StatefulWidget {
  Function validatorFunction;
  TextEditingController controller;
  Function onSaved;
  Function onTap;
  Widget icon;
  String labelText;
  TextInputType keyboardType;
  EdgeInsetsGeometry contentPadding;
  String initialValue;
  bool obscureText;
  InputDecoration decoration;
  double height;
  double width;
  List<TextInputFormatter> inputFormatters;
  int maxLength;
  Function(String) onChanged;
  int maxLines;
  TextStyle labelStyle;
  bool autofocus;
  TextStyle style;

  CustomTextField(
      {@required this.onSaved,
      this.controller,
      this.icon,
      this.labelText,
      this.height = 315,
      this.width = 60,
      this.validatorFunction,
      this.contentPadding,
        this.decoration,
      this.initialValue,
      this.inputFormatters,
        this.onTap,
      this.obscureText = false,
      this.maxLength,
      this.onChanged,
      this.keyboardType,
      this.maxLines,
      this.labelStyle,
      this.autofocus,
      this.style});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        autofocus: widget.autofocus ?? false,
        maxLines: widget.maxLines ?? 1,
        inputFormatters: widget.inputFormatters,
        style: widget.style ?? TextStyle(color: Colors.black),
        controller: widget.controller,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
        onSaved: widget.onSaved,
        validator: widget.validatorFunction,
        decoration: new InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.blue : Colors.black
          ),
          contentPadding: widget.contentPadding,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          border: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          prefixIcon: Icon(Icons.mail_outline),
        ),
        initialValue: widget.initialValue,
      ),
    );
  }
}
