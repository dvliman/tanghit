import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/app_state.dart';
import 'package:tanghit/styles.dart' as Asset;

import 'navigations/home_tab.dart';

void main() =>
    runApp(ScopedModel<AppState>(
        model: AppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "tanghit",
          home: HomeTab(),
          theme: ThemeData(
            accentColor: Asset.Colors.green,
            hintColor: Asset.Colors.paleGray,
            primaryColor: Asset.Colors.dusk,
            primaryColorLight: const Color(0xff6d7999),
            primaryColorDark: const Color(0xff172540),
            disabledColor: const Color(0xffdde2ec),
            backgroundColor: const Color(0xfff9fbfd),
            bottomAppBarColor: const Color(0xff22202f),
            dialogBackgroundColor: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(color: Asset.Colors.dusk),
              subtitle: TextStyle(color: Asset.Colors.cloudyBlue),
              subhead: TextStyle(color: Colors.black),
              body1: TextStyle(color: Colors.black),
              display1: TextStyle(color: Asset.Colors.paleGray),
              display2: TextStyle(color: Asset.Colors.mediumGray),
              display3: TextStyle(color: Asset.Colors.paleGray),
              headline: TextStyle(color: Colors.white),
              overline: TextStyle(color: Asset.Colors.paleGray),
            ),
          ),
        )
    ));
