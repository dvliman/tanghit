import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/Data/AppState.dart';
import 'package:tanghit/Navigations/HomeTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
        model: AppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "tanghit",
          home: HomeTab(),
          theme: ThemeData(
            accentColor: Colors.green,
            hintColor: Colors.grey,
            primaryColor: Colors.black,
            disabledColor: const Color(0xffdde2ec),
            backgroundColor: const Color(0xfff9fbfd),
            bottomAppBarColor: const Color(0xff22202f),
          ),
        )
    );
  }
}

