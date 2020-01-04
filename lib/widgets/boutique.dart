
import 'package:flutter/cupertino.dart';
import 'package:tanghit/data/vendor.dart';

class Boutique extends StatelessWidget {
  final Vendor vendor;

  const Boutique(this.vendor);

  @override
  Widget build(BuildContext context) {
    return Text(vendor.name);
  }
}