import 'package:flutter/material.dart';
import 'package:tanghit/Data/Vendor.dart';
import 'package:tanghit/Widgets/BoutiqueCell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoutiquesScreen extends StatefulWidget {
  @override
  BoutiquesScreenState createState() => BoutiquesScreenState();
}

// shamelessly copy paste from: https://stackoverflow.com/questions/50555077/create-infinite-list-with-cloud-firestore-in-flutter
// it would be nice if we can extract out into `ListStatefulScaffold` and pass in onLOadMore, onRefresh function like this:
// https://github.com/pd4d10/git-touch/blob/c2076df7b75683520de176c8ebee6ca2af51e748/lib/screens/gh_news.dart#L53
class BoutiquesScreenState extends State<BoutiquesScreen> {
  ScrollController controller;
  bool _isLoading;
  DocumentSnapshot _lastDocument;
  List<DocumentSnapshot> _data = new List<DocumentSnapshot>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
    _isLoading = true;
    _getData();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    print("scrollListener: _isLoading: " + _isLoading.toString());

    if (!_isLoading) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        print("scrollListener: scrolled through maxScrollExtend");
        setState(() => _isLoading = true);
        _getData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(title: Text("Boutiques")),
        body: RefreshIndicator(
            onRefresh: () async {
              _data.clear();
              _lastDocument = null;
              await _getData();
            },
            child: ListView.builder(
                controller: controller,
                itemCount: _data.length + 1,
                itemBuilder: (_, int index) {
                  if (index < _data.length) {
                    return BoutiqueCell(Vendor.fromDocument(_data[index]));
                  }

                  return Center(
                      child: new Opacity(
                          opacity: _isLoading ? 1.0 : 0.0,
                          child: new SizedBox(
                              width: 32.0,
                              height: 32.0,
                              child: new CircularProgressIndicator())));
                })));
  }

  Future<Null> _getData({int limit = 2}) async {
    Query query = Firestore.instance
        .collection("vendors")
        .orderBy("created", descending: true)
        .limit(limit);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument);
    }

    QuerySnapshot snapshot = await query.getDocuments();

    if (snapshot != null && snapshot.documents.length > 0) {
      _lastDocument = snapshot.documents[snapshot.documents.length - 1];

      if (mounted) {
        setState(() {
          _isLoading = false;
          _data.addAll(snapshot.documents);
        });
      }
    } else {
      setState(() => _isLoading = false);
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('No more boutiques!'),
        ),
      );
    }

    return null;
  }
}
