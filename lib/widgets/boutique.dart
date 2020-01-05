import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanghit/data/vendor.dart';
import 'package:tanghit/widgets/boutique_detail.dart';

class Boutique extends StatelessWidget {
  final Vendor vendor;

  const Boutique(this.vendor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BoutiqueDetail(this.vendor)))
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(1.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            child: Row(
              children: <Widget>[
                boutiqueImage(vendor),
                Expanded(child: boutiqueDescription(vendor, 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boutiqueImage(Vendor vendor) => ClipRRect(
        child: FadeInImage(
          placeholder: AssetImage(vendor.mainPhoto),
          image: AssetImage(vendor.mainPhoto),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );

  Widget boutiqueDescription(Vendor vendor, double height) => Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              vendor.name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              vendor.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
