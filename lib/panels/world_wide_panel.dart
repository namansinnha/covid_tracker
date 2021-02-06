import 'package:covid_tracker/components/status_panel.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  WorldWidePanel({this.worldData});

  @override
  Widget build(BuildContext context) {
    String confirmedCases =
        worldData['cases'].toString().replaceAllMapped(reg, mathFunc);
    String activeCases =
        worldData['active'].toString().replaceAllMapped(reg, mathFunc);
    String recoveredCases =
        worldData['recovered'].toString().replaceAllMapped(reg, mathFunc);
    String deathCases =
        worldData['deaths'].toString().replaceAllMapped(reg, mathFunc);

    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: [
        StatusPanel(
          panelColor: Colors.red[100],
          textColor: Colors.red,
          panelTitle: 'CONFIRMED',
          panelCount: confirmedCases,
        ),
        StatusPanel(
          panelColor: Colors.blue[100],
          textColor: Colors.blue,
          panelTitle: 'ACTIVE',
          panelCount: activeCases,
        ),
        StatusPanel(
          panelColor: Colors.green[100],
          textColor: Colors.green,
          panelTitle: 'RECOVERED',
          panelCount: recoveredCases,
        ),
        StatusPanel(
          panelColor: Colors.grey[400],
          textColor: Colors.grey[800],
          panelTitle: 'DEATHS',
          panelCount: deathCases,
        ),
      ],
    );
  }
}
