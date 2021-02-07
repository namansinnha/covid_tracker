import 'package:flutter/material.dart';

class CountryStats extends StatelessWidget {
  const CountryStats({
    @required this.countryData,
    @required this.reg,
    @required this.mathFunc,
    @required this.indexes,
  });

  final List countryData;
  final RegExp reg;
  final Function mathFunc;
  final int indexes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    countryData[indexes]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Image.network(
                  countryData[indexes]['countryInfo']['flag'],
                  height: 40,
                  width: 50,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'CONFIRMED : ${countryData[indexes]['cases'].toString().replaceAllMapped(reg, mathFunc)} cases',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    'ACTIVE : ${countryData[indexes]['active'].toString().replaceAllMapped(reg, mathFunc)} cases',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    'RECOVERED : ${countryData[indexes]['recovered'].toString().replaceAllMapped(reg, mathFunc)} cases',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    'DEATH : ${countryData[indexes]['deaths'].toString().replaceAllMapped(reg, mathFunc)} cases',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
