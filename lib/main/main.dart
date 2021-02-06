import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'file:///A:/FlutterDevelopement/FlutterProjects/CovidTracker/covid_tracker/lib/helper/constants.dart';
import 'file:///A:/FlutterDevelopement/FlutterProjects/CovidTracker/covid_tracker/lib/main/home_page.dart';

void main() {
  FlutterStatusbarcolor.setStatusBarColor(primaryColor);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}
