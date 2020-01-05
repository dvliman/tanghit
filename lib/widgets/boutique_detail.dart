import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/data/vendor.dart';

class BoutiqueDetail extends StatelessWidget {
  final Vendor vendor;

  const BoutiqueDetail(this.vendor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(vendor.name), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ]),
        body: Column(children: [
          singleImage(vendor.mainPhoto),
          name(vendor.name),
          description(vendor.description),
        ]));
  }

  Widget singleImage(String path) {
    return Center(
      child: Container(
          height: 300,
          width: 220,
          alignment: Alignment.center,
          child: FadeInImage(
            placeholder: AssetImage("assets/images/placeholder.png"),
            image: AssetImage(path),
          )),
    );
  }

  Widget name(String name) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget description(String description) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        alignment: Alignment.centerLeft,
        child: Text(description,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal)));
  }
}
