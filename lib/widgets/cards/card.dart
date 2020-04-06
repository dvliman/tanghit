import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/services/screen_ratio.dart';
import 'package:tanghit/services/shared_pref_service.dart';
import 'package:tanghit/utils/custom_text.dart';

final List<String> imagelist = [
  'assets/images/wedding.jpeg',
  'assets/images/wedding2.jpg',
  'assets/images/ornament.jpeg'
];

class DashboardCard extends StatefulWidget {
  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isStarted = false;
  bool isTapped = false;
  int _current = 0;
  bool isClicked = false;

  @override
  void initState() {
    initialisation();
    super.initState();
  }

  initialisation() async {
    await ScreenRatio.setScreenRatio();
    await SharedPrefService.setSharedPreference();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScreenRatio.setScreenRatio(
        currentScreenHeight: screenSize.height,
        currentScreenWidth: screenSize.width);
    var hf = ScreenRatio.heightRatio;
    var wf = ScreenRatio.widthRatio;

    return Material(
      child: Container(
        height: 600 * hf,
        width: screenSize.width,
        color: Colors.white,
        child: Stack(children: <Widget>[
          Container(
//
            child: CarouselSlider(
              autoPlay: true,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              height: 500 * hf,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imagelist.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 500 * hf,
                      width: screenSize.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(i),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
              top: 420.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(imagelist, (index, url) {
                  return Container(
                    width: 6.0,
                    height: 6.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.amber : Colors.grey),
                  );
                }),
              )),
          Positioned(
            left: 10.0,
            top: 560 * hf,
            child: CustomText(
              customText: "Boutique1",
              textColor: Colors.amber,
            ),
          ),
          Positioned(
              right: 10.0,
              top: 560 * hf,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 20 * wf,
                    ),
                    Icon(Icons.chat),
                    SizedBox(
                      width: 20 * wf,
                    ),
                    Icon(Icons.share)
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
