import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/Data/AppState.dart';
import 'package:tanghit/Widgets/BoutiqueCell.dart';

class BoutiquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(title: Text("Boutiques"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ]),
        body: ListView.builder(
            itemCount: model.vendors.length,
            itemBuilder: (context, index) {
              return BoutiqueCell(model.vendors[index]);
            }));
  }
}
