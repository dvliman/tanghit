import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/app_state.dart';
import 'package:tanghit/screens/home.dart';
import 'package:tanghit/styles.dart';

void main() =>
    runApp(ScopedModel<AppState>(
        model: AppState(),
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          color: Styles.appBackground,
          home: HomeScreen(),
        )
    ));
