import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/data/vendor.dart';

class BoutiqueDetail extends StatelessWidget {
  final Vendor vendor;

  const BoutiqueDetail(this.vendor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(vendor.name)),
        body: Column(children: [
          singleImage(vendor.mainPhoto)
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
        )
      ),
    );
  }
}
