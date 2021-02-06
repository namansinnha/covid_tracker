import 'package:flutter/material.dart';

class MostEffectedCountriesPanel extends StatelessWidget {
  final List countryData;

  MostEffectedCountriesPanel({this.countryData});

  @override
  Widget build(BuildContext context) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 10, top: 15, right: 10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Deaths : ${countryData[index]['deaths'].toString().replaceAllMapped(reg, mathFunc)}',
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            ],
          ),
        );
      },
      itemCount: 8,
    );
  }
}
