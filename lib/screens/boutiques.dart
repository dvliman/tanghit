import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/app_state.dart';
import 'package:tanghit/data/vendor.dart';
import 'package:tanghit/styles.dart';
import 'package:tanghit/widgets/boutique.dart';

class BoutiquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(builder: (context) {
      final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Boutiques"),
        ),
        child: Center(
          child: model.vendors.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "No boutiques at the moment ...",
                    style: Styles.headlineDescription,
                  ),
                )
              : ListView(
                  children: [
                    SizedBox(height: 24),
                    for (Vendor vendor in model.vendors)
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                        child: Boutique(vendor),
                      ),
                  ],
                ),
        ),
      );
    });
  }
}
