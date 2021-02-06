import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String panelTitle;
  final String panelCount;

  StatusPanel(
      {this.panelColor, this.textColor, this.panelTitle, this.panelCount});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(5.0),
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            panelTitle,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Text(
            panelCount,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 32.0),
          ),
        ],
      ),
    );
  }
}
