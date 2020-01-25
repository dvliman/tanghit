import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListTile(title: Text("Support Center")),
      InkWell(
          onTap: () {
            _call(context, '714-253-2851');
          },
          child: ListTile(
              leading: Icon(Icons.call), title: Text("Call: (714) 253 2851"))),
      InkWell(
          onTap: () {
            _email(context, 'support@tanghit.com');
          },
          child: ListTile(
              leading: Icon(Icons.mail),
              title: Text("Email: support@tanghit.com"))),
    ]);
  }

  _call(BuildContext context, String phone) async {
    final uri = 'tel:$phone';

    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to call: $phone")));
    }
  }

  _email(BuildContext context, String email) async {
    final uri = 'mailto:$email';

    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to email: $email")));
    }
  }
}
