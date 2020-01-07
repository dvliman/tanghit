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
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ]),
        body: Column(children: [
          Expanded(flex: 3, child: buildImage(context, vendor.mainPhoto)),
          buildOverview(vendor),
          buildProperties(vendor),
          buildInquiry(),
        ]));
  }

  Widget buildImage(BuildContext context, String photo) => Container(
        child: Image.asset(photo,
            fit: BoxFit.fill, width: MediaQuery.of(context).size.width - 80),
      );
}

ListTile buildOverview(Vendor vendor) => ListTile(
    title: Text("Overview",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    subtitle: Text(vendor.description));

Widget buildProperties(Vendor vendor) => Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xffb0b0b0))),
      padding: const EdgeInsets.all(8),
      child: Table(
        children: [
          buildProperty("Category", maybeEmpty(vendor.category.toString())),
          buildProperty("Email", maybeEmpty(vendor.email)),
          buildProperty("Phone", maybeEmpty(vendor.phone)),
          buildProperty("Homepage", maybeEmpty(vendor.homepage)),
          buildProperty("Address", vendor.address),
        ],
      ),
    );

TableRow buildProperty(String prop, String value) => TableRow(children: [
      TableCell(child: Text(prop)),
      TableCell(child: Text(value, textAlign: TextAlign.end)),
    ]);

Widget buildInquiry() => Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Send inquiry",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ],
    );

String maybeEmpty(String x) => x != null ? x : "";
