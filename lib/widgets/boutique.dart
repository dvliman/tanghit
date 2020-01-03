import 'package:flutter/cupertino.dart';
import 'package:tanghit/data/vendor.dart';
import 'package:tanghit/screens/boutique_detail.dart';
import 'package:tanghit/widgets/zoom_clip_asset_image.dart';
import 'package:tanghit/styles.dart';
import 'dart:developer' as developer;

class Boutique extends StatelessWidget {
  final Vendor vendor;

  const Boutique(this.vendor);

  @override
  Widget build(BuildContext context) {
    developer.log("screen: boutique");

    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push<void>(CupertinoPageRoute(
            builder: (context) => BoutiqueDetailScreen(this.vendor),
            fullscreenDialog: true,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZoomClipAssetImage(
            imageAsset: vendor.mainPhoto,
            zoom: 2.4,
            height: 72,
            width: 72,
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(vendor.name, style: Styles.headlineName),
                  ],
                ),
                Text(
                  vendor.description,
                  style: Styles.headlineDescription,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}