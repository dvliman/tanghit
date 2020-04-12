import 'package:flutter/material.dart';

String backgroundimage = ('assets/images/background_header.png');

class ShopDetailPage extends StatefulWidget {
  final int index;
  final String title;

  ShopDetailPage({this.index, this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShopDetailPageState();
  }
}

class ShopDetailPageState extends State<ShopDetailPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
                height: 208,
                child: Hero(
                  tag: 0,
                  child: Container(
                    height: 208,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(backgroundimage),
                            fit: BoxFit.fill)),
                  ),
                )),
            Positioned(
              top: 30,
              left: MediaQuery.of(context).size.width / 2 - 20,
              child: Center(
                child: CircleAvatar(
                  child: ClipOval(
                      child: Image.asset("assets/images/urban_dhara.jpeg")),
                  radius: 30.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
            Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Text(
                  "Urban Dhara",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      color: Colors.white),
                )),
            Positioned(
                top: 130,
                left: 60,
                child: Container(
                  width: 300,
                  child: Text(
                    "We are all about avant-garde dressing with indian roots in energetic warm colours.",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                )),
            Positioned(
                top: 180,
                left: 120,
                child: Text(
                  "Category : Boutique",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.white),
                ))
          ],
        ),
        Expanded(
          child: DetailTabView(
            tabController: tabController,
          ),
        )
      ],
    ));
  }
}

class DetailTabView extends StatelessWidget {
  final TabController tabController;

  DetailTabView({this.tabController});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide.none,
            ),
            labelStyle: TextStyle(color: Colors.green),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.green,
            controller: tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.grid_on,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(Icons.location_on),
              ),
              Tab(
                icon: Image.asset(
                  'assets/logo/whatsapp-logo-symbol-vector.png',
                  width: 30,
                  height: 30,
                  color: Colors.amber,
                ),
              )
            ],
          ),
          color: Colors.white,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: <Widget>[
                  Image.asset(
                    'assets/images/design1.png',
                  ),
                  Image.asset(
                    'assets/images/design2.png',
                  ),
                  Image.asset(
                    'assets/images/design3.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                  Image.asset(
                    'assets/images/design4.png',
                  ),
                  Image.asset(
                    'assets/images/design5.png',
                  ),
                  Image.asset(
                    'assets/images/design6.png',
                  ),
                ],
              ),
              Text("Hello"),
              Center(
                  child: Text(
                "Yet to Come!!",
                style: TextStyle(fontSize: 25.0),
              ))
            ],
          ),
        )
      ],
    );
  }
}
