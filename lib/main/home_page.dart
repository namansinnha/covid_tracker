import 'dart:convert';

import 'package:covid_tracker/helper/constants.dart';
import 'package:covid_tracker/panels/info_panel.dart';
import 'package:covid_tracker/panels/most_effected_countries_panel.dart';
import 'package:covid_tracker/panels/world_wide_panel.dart';
import 'package:covid_tracker/screens/regional_data_secreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  List countryData;

  fetchWorldwideData() async {
    http.Response response = await http.get(WORLD_DATA_URL);
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  fetchMostEffectedCountriesData() async {
    http.Response response = await http.get(MOST_EFFECTED_COUNTRY_DATA_URL);
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();

    fetchWorldwideData();
    fetchMostEffectedCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID-19 TRACKER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.orange[100],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Worldwide',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return (RegionalDataScreen());
                      }));
                    },
                    child: Material(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      elevation: 16.0,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            worldData == null
                ? Center(child: CircularProgressIndicator())
                : WorldWidePanel(worldData: worldData),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    '05 Most Effected Countries',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ],
              ),
            ),
            countryData == null
                ? Center(child: CircularProgressIndicator())
                : MostEffectedCountriesPanel(countryData: countryData),
            InfoPanel(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'WE ARE TOGETHER IN THE FIGHT WITH COVID - 19',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
