import 'package:flutter/material.dart';
import 'package:tanghit/Data/Vendor.dart';
import 'package:tanghit/Widgets/BoutiqueDetail.dart';

class BoutiqueCell extends StatelessWidget {
  final Vendor vendor;

  const BoutiqueCell(this.vendor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BoutiqueDetail(this.vendor)))
            },
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(vendor.mainPhoto),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(vendor.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0,0,20,0),
                        child: Text(
                          vendor.address,
                          textScaleFactor: 0.8,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
            AspectRatio(
                aspectRatio: 4.0 / 3.0,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(vendor.mainPhoto),
                  placeholder: NetworkImage(vendor.mainPhoto),
                )),
          ],
        ));
  }
}
