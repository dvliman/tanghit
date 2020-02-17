import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/Data/Vendor.dart';
import 'package:tanghit/Widgets/InfoSheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share/share.dart';
import 'dart:io' show Platform;

class BoutiqueDetail extends StatelessWidget {
  const BoutiqueDetail(this.vendor);

  final Vendor vendor;

  Widget buildImage(List<String> photos) {
    return Carousel(photos: photos);
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
            child: Column(children: [
              buildImage(vendor.photos),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Overview",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(vendor.description)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: buildProperties(vendor)),
              buildInquiry(context),
            ])));
  }
}

class Carousel extends StatefulWidget {
  Carousel({Key key, this.photos}) : super(key: key);

  final List<String> photos;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    var height = fullScreen ? MediaQuery.of(context).size.height : 400.0;
    var viewportFraction = fullScreen ? 1.0 : 0.8;
    var edgeInsets = EdgeInsets.symmetric(horizontal: fullScreen ? 0.0 : 5.0);
    var color = fullScreen ? Colors.black : Colors.white;

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: height,
        color: color,
        curve: Curves.easeOut,
        child: CarouselSlider(
          height: height,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: viewportFraction,
          items: widget.photos.map((photo) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    margin: edgeInsets,
                    child: Image.network(photo, fit: BoxFit.fitWidth));
              },
            );
          }).toList(),
        ),
      ),
      onTap: () => {
        setState(() {
          fullScreen = !fullScreen;
        })
      },
      onPanStart: (pan) => {
        print("onPanStart")
      },
      onPanDown: (pan) => {
        print("onPanDown")
      },
      onPanUpdate: (pan) => {
        print("onPanUpdate")
      },
    );
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
