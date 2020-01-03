import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/app_state.dart';
import 'package:tanghit/data/vendor.dart';
import 'package:tanghit/widgets/close_button.dart';
import 'dart:developer' as developer;

class BoutiqueDetailScreen extends StatefulWidget {
  final Vendor vendor;

  BoutiqueDetailScreen(this.vendor);

  @override
  _BoutiqueDetailState createState() => _BoutiqueDetailState();
}

class _BoutiqueDetailState extends State<BoutiqueDetailScreen> {

  Widget _buildHeader(BuildContext context, AppState model) {
    final veggie = model.vendors[0]; // TODO: get by id

    developer.log("screen-enter: boutique-details");

    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(
              veggie.mainPhoto,
              fit: BoxFit.cover,
              semanticLabel: 'A background image of ${veggie.name}',
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: CloseButton(() {
                Navigator.of(context).pop();
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, model),
          Expanded(
            child: Text(model.vendors[0].description)
          ),
        ],
      ),
    );
  }
}
