import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
  bool isClicked = false;

  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  List<T> map<T>(List list, Function handler) {
    var result = <T>[];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            CardHeader(),
            Container(
              child: CarouselSlider(
                autoPlay: true,
                viewportFraction: 1.0,
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                height: 224,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imagelist.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
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
            Container(
              height: 160,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(imagelist, (index, url) {
                          return Container(
                            width: 6.0,
                            height: 6.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Colors.black
                                    : Colors.grey),
                          );
                        }),
                      )),
                  Positioned(
                    left: 10,
                    top: 30,
                    child: Container(
                      child: Text(
                        "Our signature blue cotton top is surely a wardrobe staple. You can dress it up or dress it down.",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      width: 400,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 80,
                    child: Text(
                      '#cotton #everydaycasuals #officewear',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Colors.indigo),
                    ),
                  ),
                  Positioned(
                      left: 10.0,
                      bottom: 20,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              child: isClicked
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border),
                              onTap: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.chat),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.arrow_forward),
                            SizedBox(
                              width: 250,
                            ),
                            Image.asset(
                              'assets/logo/whatsapp-logo-symbol-vector.png',
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: Colors.white,
      child: (Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          Image.asset(
            'assets/images/urban_dhara.jpeg',
            height: 38,
            width: 39,
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Uraban Dhara',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 13,
                  ),
                  Text(
                    'Kawai, Huwaii',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
