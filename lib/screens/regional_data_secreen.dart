import 'dart:convert';

import 'package:covid_tracker/components/country_stats.dart';
import 'package:covid_tracker/helper/constants.dart';
import 'package:covid_tracker/helper/search_deligate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegionalDataScreen extends StatefulWidget {
  @override
  _RegionalDataScreenState createState() => _RegionalDataScreenState();
}

class _RegionalDataScreenState extends State<RegionalDataScreen> {
  List countryData;
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  fetchCountriesData() async {
    http.Response response = await http.get(COUNTRY_DATA_URL);
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchInListView(searchedCountryList: countryData));
            },
          )
        ],
        title: Text(
          'Regional Stats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return CountryStats(
                  countryData: countryData,
                  reg: reg,
                  mathFunc: mathFunc,
                  indexes: index,
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
