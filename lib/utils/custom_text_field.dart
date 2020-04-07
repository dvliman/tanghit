import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
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

  final bool autofocus;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController controller;
  final InputDecoration decoration;
  final double height;
  final Widget icon;
  final String initialValue;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextStyle labelStyle;
  final String labelText;
  final int maxLength;
  final int maxLines;
  final bool obscureText;
  final Function onSaved;
  final Function onTap;
  final TextStyle style;
  final Function validatorFunction;
  final double width;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();

  final Function(String) onChanged;
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
          contentPadding: widget.contentPadding,
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          prefixIcon: Icon(Icons.mail_outline),
        ),
        initialValue: widget.initialValue,
      ),
    );
  }
}
