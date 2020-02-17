import 'package:flutter/material.dart';
import 'package:tanghit/Data/Vendor.dart';
import 'package:tanghit/Widgets/BoutiqueCell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoutiquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(title: Text("Boutiques"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ]),
        body: FutureBuilder(
            future: getBoutiqueCells(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                    alignment: FractionalOffset.center,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CircularProgressIndicator());
              } else {
                return ListView(children: snapshot.data);
              }
            }));
  }

  getBoutiqueCells() async {
    final snapshot =
        await Firestore.instance.collection("vendors").getDocuments();

    return snapshot.documents
        .map((doc) => BoutiqueCell(Vendor.fromDocument(doc)))
        .toList();
  }
}
