import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/Data/Vendor.dart';
import 'package:tanghit/Widgets/InfoSheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'dart:io' show Platform;

class BoutiqueDetail extends StatelessWidget {
  final Vendor vendor;

  const BoutiqueDetail(this.vendor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(vendor.name), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => {Share.share(_getShareText())},
          )
        ]),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: buildImage(vendor.mainPhoto),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(vendor.description)),
            buildProperties(vendor),
            buildInquiry(context),
          ]),
        )));
  }

  Widget buildImage(String photo) {
    return Container(
      child: Image.asset(photo, fit: BoxFit.fitWidth),
    );
  }

  String _getShareText() {
    return "Checkout this app: ${_getDistributionUrl()}";
  }

  String _getDistributionUrl() {
    // AndroidManifest.xml
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=com.tanghit.tanghit";
    }

    // itunes connect, get app id
    return "https://itunes.apple.com/us/app/<app-name>/<app-id>";
  }
}

ListTile buildOverview(Vendor vendor) {
  return ListTile(
      title: Text("Overview",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      subtitle: Text(vendor.description));
}

Widget buildProperties(Vendor vendor) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        // TODO: if value null, dont make row
        buildProperty("Category", maybeEmpty(vendor.category.toString())),
        buildProperty("Email", maybeEmpty(vendor.email),
            () async => launch("mailto:${vendor.email}")),
        buildProperty("Phone", maybeEmpty(vendor.phone),
            () async => launch("tel://${vendor.phone}")),
        buildProperty("Homepage", maybeEmpty(vendor.homepage),
            () async => launch(vendor.homepage)),
        buildProperty("Address", vendor.address, () => print(vendor.address)),
      ],
    ),
  );
}

Padding buildProperty(String prop, String value, [Function onClick]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      Expanded(child: Text(prop)),
      Expanded(
          child: GestureDetector(
              onTap: () {
                if (onClick != null) onClick();
              },
              child: Text(value)))
    ]),
  );
}

Widget buildInquiry(BuildContext context) {
  // TODO: takes in vendor object? mailto:<email>?subject=<vendor-id-title>
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: FlatButton(
              onPressed: () => {
                    showModalBottomSheet(
                        context: context, builder: (context) => InfoSheet())
                  },
              child: Text(
                "Send inquiry",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    ],
  );
}

String maybeEmpty(String x) {
  return x != null ? x : "";
}
