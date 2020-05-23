import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFieldWithIcon extends StatelessWidget {

  final TextEditingController myController;
  final String hint;
  final String iconLocation;
  final dynamic onIconTap;
  final dynamic onSearch;
  final String screen;

  TextFieldWithIcon({
    this.myController,
    this.hint,
    this.iconLocation,
    this.onIconTap,
    this.onSearch,
    this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10  )),
      ),
      width: 335,
      height: 50,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 15 ,
              right: 15 ,
            ),
            child: Container(
              width: 270 ,
              child: TextFormField(
                onChanged: (value) {
                  onSearch(value);
                },
                enabled: screen == 'preview' ? false : true,
                cursorColor: Colors.red,
                cursorWidth: 4 ,
                cursorRadius: Radius.circular(10  ),
                inputFormatters: [LengthLimitingTextInputFormatter(256)],
                controller: myController,
                style: TextStyle(
                  fontFamily: 'Gotham-Book',
                  fontSize: 16,
                  color:  Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham-Book',
                    fontSize: 16  ,
                    color:  Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onIconTap();
            },
            child: Container(
              height: 24 ,
              width: 24 ,
              child: Image.asset(
                iconLocation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
