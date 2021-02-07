import 'package:covid_tracker/helper/constants.dart';
import 'package:covid_tracker/main/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(primaryColor);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  runApp(SetUpTheme());
}

class SetUpTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
