import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget countCard(String label, int count, BuildContext context, colorCode) {
  final double countFontSize = MediaQuery.of(context).size.width > 390 ? 45.0 : 30.0;
  final double labelFontSize = MediaQuery.of(context).size.width > 390 ? 18.0 : 15.0;
  return Container(
    padding: EdgeInsets.all(10.0),
    height: 80.0,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: labelFontSize,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        Positioned(
          right: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 60,
            alignment: Alignment.centerRight,
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: countFontSize,
                color: Color(colorCode),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
