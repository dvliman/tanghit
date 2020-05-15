import 'package:flutter/material.dart';
import 'package:tanghit/models/detailed_page_model.dart';

String backgroundimage = ('assets/images/background_header.png');

class ShopDetailPage extends StatefulWidget {
  ShopDetailPage({this.index, this.title});

  final int index;
  final String title;

  @override
  State<StatefulWidget> createState() {
    return ShopDetailPageState();
  }
}

class ShopDetailPageState extends State<ShopDetailPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset('assets/images/urban_dhara.jpeg')),
                  radius: 30.0,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
            Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Text(
                  DetailedPageModel.hardcordedDetailedPage.title,
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
                    DetailedPageModel.hardcordedDetailedPage.description,
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
                  'Category : ${DetailedPageModel.hardcordedDetailedPage.category}',
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
  DetailTabView({this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
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
                  for (int i = 0; i < 18; i++)
                    Image.asset(
                        DetailedPageModel.hardcordedDetailedPage.imageList[i])
                ],
              ),
              Text('Hello'),
              Center(
                  child: Text(
                'Yet to Come!!',
                style: TextStyle(fontSize: 25.0),
              ))
            ],
          ),
        )
      ],
    );
  }
}
