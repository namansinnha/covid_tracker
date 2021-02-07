import 'package:covid_tracker/components/country_stats.dart';
import 'package:flutter/material.dart';

class SearchInListView extends SearchDelegate {
  final List searchedCountryList;
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  SearchInListView({this.searchedCountryList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? searchedCountryList
        : searchedCountryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return CountryStats(
            countryData: suggestionList,
            reg: reg,
            mathFunc: mathFunc,
            indexes: index);
      },
      itemCount: suggestionList.length,
    );
  }
}
