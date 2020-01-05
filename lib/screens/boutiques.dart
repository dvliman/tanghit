import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/app_state.dart';
import 'package:tanghit/widgets/boutique.dart';

class BoutiquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Boutiques"),
        ),
        body: ListView.builder(
            itemCount: model.vendors.length,
            itemBuilder: (context, index) {
              return Boutique(model.vendors[index]);
            }));
  }
}
