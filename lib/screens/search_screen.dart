import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanghit/widgets/lableListView.dart';
import 'package:tanghit/widgets/textFieldWithIcon.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchFieldController = TextEditingController();
  List<String> topics = [
    'topic 1',
    'topic 2',
    'long topic 3',
    'a very very long topic 4',
    'this seems like a short topic but is not',
  ];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        ChangeNotifierProvider(
//          create: (context) => searchController,
//        )
      ],
      child: Scaffold(

        body: GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color:  Colors.black,
                  //height: 1188  ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: 375,
                        height: 188,
                        color: Colors.white,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Column(
                                children: <Widget>[
                                  TextFieldWithIcon(
                                    screen: 'search',
                                    myController: searchFieldController,
                                    hint:
                                    'ex. keywords, topics, users, locations, etc.',
                                    iconLocation:
                                    'assets/images/search/search.png',
                                    onSearch: (value) {
                                      print('Hello');

                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                        EdgeInsets.only(left: 20  , bottom: 20  ),
                        //height: 1000  ,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20  ),
                              child: Text(
                                'PREVIOUS SEARCH RESULTS',
                                style: TextStyle(
                                  fontFamily: 'Gotham-Book',
                                  fontSize: 16  ,
                                  color:  Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20  ),
                              child: Text(
                                'Posts',
                                style: TextStyle(
                                  fontFamily: 'Gotham-Bold',
                                  fontSize: 16  ,
                                  color:  Colors.black,
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20  ),
                              child: Text(
                                'Topics',
                                style: TextStyle(
                                  fontFamily: 'Gotham-Bold',
                                  fontSize: 16  ,
                                  color:  Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20  ),
                              height: 36  ,
                              child: LableListView(
                                list: topics,
                                screen: 'search',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20  ),
                              child: Text(
                                'Users',
                                style: TextStyle(
                                  fontFamily: 'Gotham-Bold',
                                  fontSize: 16  ,
                                  color:  Colors.black,
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(top: 20  ),
                            //   height: 202  ,
                            //   child: _usersListView(),
                            // ),
                            _usersListView(),
                            // Container(
                            //   child: Text(
                            //     "Locations",
                            //     style: TextStyle(
                            //       fontFamily: 'Gotham-Bold',
                            //       fontSize: 16  ,
                            //       color:  Colors.black,
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: 36  ,
                            //   child: LableListView(
                            //     list: locations,
                            //     screen: 'search',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usersListView() {
    return Consumer(
      builder: (context, controller, _) =>
           Container(
        margin: EdgeInsets.only(top: 20  ),
        height: 202  ,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 160  ,
                height: 202  ,
                margin: EdgeInsets.only(right: 10  ),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(16  )),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16  ),
                        topRight: Radius.circular(16  ),
                      ),
                      child: Container(
                        // color: Colors.red,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(
                        //             "assets/images/post/profilePic.png"),
                        //         fit: BoxFit.cover)),
                        height: 160  ,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            ////////////////--------------------INSERT THE PROFILE IMAGE HERE--------------
                            Container(),


                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
