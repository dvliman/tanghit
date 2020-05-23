import 'package:flutter/material.dart';


class LableListView extends StatelessWidget {
  // static Widget lableListView(
  final List<String> list;
  final String screen;
  final dynamic onTagDelete;
  LableListView({this.list, this.screen, this.onTagDelete});
  // ) {

  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          padding: screen != 'post'
              ? EdgeInsets.only(left: 10, right: 10)
              : EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color:  Colors.black,
          ),
          child: Row(
            children: <Widget>[
              Text(
                list[index],
                style: TextStyle(
                  fontFamily: 'Gotham-Book',
                  fontSize: 12  ,
                  color: Colors.white,
                ),
              ),
              screen == 'post'
                  ? GestureDetector(
                onTap: () {
                  onTagDelete(index);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10  ,
                    right: 10  ,
                    top: 12  ,
                    bottom: 12  ,
                  ),
                  width: 32  ,
                  height: 36  ,
                  child: Image.asset(
                    'assets/images/post/removeTag.png',
                    fit: BoxFit.fill,
                  ),
                ),
              )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
