import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanghit/services/screen_ratio.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {@required this.onSaved,
      this.controller,
      this.icon,
      this.labelText,
      this.height,
      this.node,
      this.width,
      this.validatorFunction,
      this.decoration,
      this.obscureText = false,
      this.onChanged,
      this.onTap,
      this.editType,
      this.keyboardType,
      this.style});

  final TextEditingController controller;
  final InputDecoration decoration;
  final Function editType;
  final double height;
  final Widget icon;
  final TextInputType keyboardType;
  final String labelText;
  final FocusNode node;
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
  bool isValidated = false;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      String localValidationResult =
          widget.validatorFunction(widget.controller.text);
      setState(() {
        isValidated = (localValidationResult == null) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Theme(
        data: ThemeData(
          primaryColor: Color(0XFF1DA6AD).withOpacity(1.0),
        ),
        child: TextFormField(
          style: widget.style ?? TextStyle(color: Colors.black),
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          onEditingComplete: widget.editType,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          focusNode: widget.node,
          validator: (v) {
            String validationResult = widget.validatorFunction(v);
            setState(() {
              isValidated = (validationResult == null) ? true : false;
            });
            return validationResult;
          },
          decoration: InputDecoration(
            helperText: ' ',
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus
                    ? Color(0XFF1DA6AD).withOpacity(1.0)
                    : Colors.black),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0XFF1DA6AD).withOpacity(1.0)),
                borderRadius: BorderRadius.circular(40.0)),
            prefixIcon: widget.icon,
            suffixIcon: isValidated
                ? Icon(
                    Icons.check_circle,
                    color: Color(0XFF1DA6AD).withOpacity(1.0),
                    size: 16,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
