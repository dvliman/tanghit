import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/models/feed_card_model.dart';

final List<String> imagelist = [
  'assets/images/wedding.jpeg',
  'assets/images/wedding2.jpg',
  'assets/images/ornament.jpeg'
];

double widthValue = 5;

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
      child: CardPostModel.hardcordedPost.cardStatus
          ? Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  CardHeader(),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        CarouselSlider(
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
                        Positioned(
                            bottom: 10,
                            left: 187.5,
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
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 20,
                          child: Container(
                            child: Text(
                              CardPostModel.hardcordedPost.description,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            width: 400,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 80,
                          child: Text(
                            CardPostModel.hardcordedPost.tags,
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
            )
          : Container(),
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: (Row(
          children: <Widget>[
            SizedBox(width: widthValue),
            Image.asset(
              'assets/images/urban_dhara.jpeg',
              height: 38,
              width: 38,
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  CardPostModel.hardcordedPost.title,
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
                      "${CardPostModel.hardcordedPost.city},${CardPostModel.hardcordedPost.state}",
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
      ),
    );
  }

  double passValues() {
    return widthValue;
  }
}